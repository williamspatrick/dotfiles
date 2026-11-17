#!/usr/bin/env zsh

# Prototype patches from an openbmc repo checkout into the openbmc tree.
# Replaces the old SRCREV-bump workflow (no Gerrit push needed for testing).
#
# Usage (run inside a source checkout, e.g. ~/local/sync/openbmc-sources/bmcweb):
#   lf-obmc-patch [base [head]]
#   lf-obmc-patch <base>..<head>
#   lf-obmc-patch --clean [base [head]]
#
# With no args, patches are generated for every commit after the recipe's
# SRCREV up to HEAD. Pass an explicit base (e.g. origin/master) to override.
# If the recipe SRCREV is stale, rebase your branch onto it first (outside
# this script) so the patches apply cleanly.
#
# For each matching recipe this creates/updates:
#   <recipe-dir>/<BPN>_git.bbappend
# with:
#   STWCX_PATCH_FILES = " file://0001-....patch ..."
#   SRC_URI:append = " ${STWCX_PATCH_FILES}"
# and drops the .patch files in <recipe-dir>/<BPN>/.
# The STWCX_ prefix makes test patches easy to find and clean up.
function lf-obmc-patch() {
    local clean=0
    local args=()
    for a in "$@"; do
        case "$a" in
            --clean|-c) clean=1 ;;
            *) args+=("$a") ;;
        esac
    done

    local base="" head="HEAD"
    if [[ ${#args} -eq 1 ]]; then
        if [[ "${args[1]}" == *..* ]]; then
            base="${args[1]%%..*}"
            head="${args[1]##*..}"
            [[ -z "$base" ]] && base=""
            [[ -z "$head" ]] && head="HEAD"
        else
            base="${args[1]}"
        fi
    elif [[ ${#args} -ge 2 ]]; then
        base="${args[1]}"
        head="${args[2]}"
    fi

    if ! git rev-parse --show-toplevel >/dev/null 2>&1; then
        echo "lf-obmc-patch: not inside a git repo" >&2
        return 1
    fi
    local src_top=$(git rev-parse --show-toplevel)

    # Basename of the source repo, robust to ssh://, https://, git@, with/without .git.
    local origin_url=$(git remote get-url origin 2>/dev/null)
    if [[ -z "$origin_url" ]]; then
        echo "lf-obmc-patch: no origin remote found in $src_top" >&2
        return 1
    fi
    local repo="${origin_url%.git}"
    repo="${repo##*[:/]}"
    if [[ -z "$repo" ]]; then
        echo "lf-obmc-patch: cannot derive repo name from origin '$origin_url'" >&2
        return 1
    fi

    local LFREPO="${LFOPENBMC:-}"
    if [[ -z "$LFREPO" ]]; then
        LFREPO=$(wd path lfopenbmc 2>/dev/null)
        [[ -z "$LFREPO" ]] && LFREPO="$HOME/private/dev/openbmc/openbmc"
    fi
    if [[ ! -d "$LFREPO" ]]; then
        echo "lf-obmc-patch: openbmc tree not found at $LFREPO (set \$LFOPENBMC)" >&2
        return 1
    fi

    # Find recipes fetching this repo. Match by basename so PN != repo still works
    # (e.g. repo bmcweb -> bmcweb_git.bb).
    local files
    files=$(git -C "$LFREPO" grep -lE "git://[^[:space:]\"]*/${repo}(\\.git)?(;|[[:space:]]|\"|$)" -- '*.bb' 2>/dev/null)
    if [[ -z "$files" ]]; then
        echo "lf-obmc-patch: no recipe in $LFREPO fetches repo '$repo'" >&2
        return 1
    fi

    local default_main=""
    local f
    for f in ${(f)files}; do
        local recipe="$LFREPO/$f"
        local dir=$(dirname "$recipe")
        local bb=$(basename "$recipe")
        local bbappend="${dir}/${bb%.bb}.bbappend"
        local _pn="${bb%.bb}"
        local pn="${_pn%_*}"
        # BPN strips -native/-nativesdk suffixes (and nativesdk- prefix) so
        # target/native variants and multilib share one patch dir. For normal
        # recipes (bmcweb, phosphor-logging) BPN == PN.
        local bpn="${pn%-native}"
        bpn="${bpn%-nativesdk}"
        bpn="${bpn#nativesdk-}"
        local patchdir="${dir}/${bpn}"

        if [[ $clean -eq 1 ]]; then
            _lf_obmc_patch_clean_one "$bbappend" "$patchdir"
            continue
        fi

        # Default base is the recipe SRCREV so patches apply onto what
        # bitbake actually checks out. Fall back to origin/<main>.
        local want_base="$base"
        if [[ -z "$want_base" ]]; then
            local srcrev=$(sed -nE 's/^SRCREV\s*(\?=|=)\s*"([^"]+)".*/\2/p' "$recipe" | head -n 1)
            if [[ "$srcrev" =~ ^[0-9a-f]{40}$ ]] && git -C "$src_top" cat-file -e "${srcrev}^{commit}" 2>/dev/null; then
                want_base="$srcrev"
            else
                [[ -z "$default_main" ]] && default_main=$(gerrit-main 2>/dev/null)
                [[ -z "$default_main" ]] && default_main="master"
                want_base="origin/${default_main}"
            fi
        fi

        if ! git -C "$src_top" rev-parse --verify --quiet "${want_base}^{commit}" >/dev/null; then
            echo "lf-obmc-patch: base '$want_base' not found (fetch first?)" >&2
            return 1
        fi
        if ! git -C "$src_top" rev-parse --verify --quiet "${head}^{commit}" >/dev/null; then
            echo "lf-obmc-patch: head '$head' not found" >&2
            return 1
        fi

        local tmpdir=$(mktemp -d)
        if ! git -C "$src_top" format-patch -N --no-signature -o "$tmpdir" "${want_base}..${head}" >/dev/null; then
            echo "lf-obmc-patch: format-patch failed for ${want_base}..${head}" >&2
            rm -rf "$tmpdir"
            return 1
        fi
        local patches=("$tmpdir"/*.patch(N))
        if [[ ${#patches} -eq 0 ]]; then
            echo "lf-obmc-patch: no commits in ${want_base}..${head}, nothing to do for $f"
            rm -rf "$tmpdir"
            continue
        fi

        mkdir -p "$patchdir"
        # Remove previously generated numbered patches, keep hand-added files.
        rm -f -- ${patchdir}/[0-9][0-9][0-9][0-9]-*.patch(N)
        cp "$tmpdir"/*.patch "$patchdir/"
        rm -rf "$tmpdir"

        # bitbake do_patch QA (patch-status) requires Upstream-Status in
        # every patch. These are prototypes headed upstream, so stamp
        # Pending on any patch that lacks a status line.
        local p
        for p in ${patchdir}/[0-9][0-9][0-9][0-9]-*.patch(N); do
            _lf_obmc_patch_add_upstream_status "$p"
        done

        _lf_obmc_patch_write_bbappend "$bbappend" "$patchdir"
        echo "lf-obmc-patch: $f <- ${want_base}..${head}"
        echo "  bbappend: $bbappend"
        echo "  patches:  $patchdir/"
    done
}

function lf-obmc-patch-clean() {
    lf-obmc-patch --clean "$@"
}

function _lf_obmc_patch_clean_one() {
    local bbappend="$1" patchdir="$2"
    if [[ -f "$bbappend" ]]; then
        # Delete the managed block.
        local tmp=$(mktemp)
        awk '/^# BEGIN STWCX lf-obmc-patch/{skip=1;next} /^# END STWCX lf-obmc-patch/{skip=0;next} !skip' \
            "$bbappend" > "$tmp"
        # Drop the FILESEXTRAPATHS line we manage if no file:// refs remain.
        # Handle both ${BPN} (current) and legacy ${PN} lines.
        if ! grep -q 'file://' "$tmp"; then
            grep -vF 'FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"' "$tmp" > "${tmp}.2"
            mv "${tmp}.2" "$tmp"
            grep -vF 'FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"' "$tmp" > "${tmp}.2"
            mv "${tmp}.2" "$tmp"
        fi
        # Drop the file if nothing but blank lines remain.
        if [[ -z "$(grep -vE '^[[:space:]]*$' "$tmp")" ]]; then
            rm -f "$bbappend" "$tmp"
            echo "lf-obmc-patch-clean: removed $bbappend"
        else
            mv "$tmp" "$bbappend"
            echo "lf-obmc-patch-clean: stripped STWCX block from $bbappend"
        fi
    else
        echo "lf-obmc-patch-clean: no bbappend at $bbappend"
    fi
    rm -f -- ${patchdir}/[0-9][0-9][0-9][0-9]-*.patch(N)
    rmdir "$patchdir" 2>/dev/null && echo "lf-obmc-patch-clean: removed empty $patchdir/"
}

function _lf_obmc_patch_add_upstream_status() {
    local patch="$1"
    grep -q '^Upstream-Status:' "$patch" && return 0
    local tmp=$(mktemp)
    awk '!done && /^---$/ { print ""; print "Upstream-Status: Pending"; print ""; done=1 } { print }' \
        "$patch" > "$tmp" && mv "$tmp" "$patch"
}

function _lf_obmc_patch_write_bbappend() {
    local bbappend="$1" patchdir="$2"
    local begin="# BEGIN STWCX lf-obmc-patch (managed - safe to delete)"
    local end="# END STWCX lf-obmc-patch"
    local tmp=$(mktemp)

    if [[ -f "$bbappend" ]]; then
        awk -v b="$begin" -v e="$end" '
            $0==b {skip=1;next}
            $0==e {skip=0;next}
            !skip {print}
        ' "$bbappend" > "$tmp"
    else
        : > "$tmp"
    fi

    # Migrate legacy ${PN} line to ${BPN} if present, else ensure ${BPN} line.
    if grep -qF 'FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"' "$tmp" \
        && ! grep -qF 'FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"' "$tmp"; then
        sed 's#FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"#FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"#' "$tmp" > "${tmp}.2"
        mv "${tmp}.2" "$tmp"
    fi
    if ! grep -qF 'FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"' "$tmp"; then
        { echo 'FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"'; echo ""; cat "$tmp"; } > "${tmp}.2"
        mv "${tmp}.2" "$tmp"
    fi

    {
        echo "$begin"
        echo 'STWCX_PATCH_FILES = " \'
        local p
        for p in ${patchdir}/[0-9][0-9][0-9][0-9]-*.patch(N); do
            echo "    file://${p##*/} \\"
        done
        echo '"'
        echo ""
        echo 'SRC_URI:append = " ${STWCX_PATCH_FILES}"'
        echo "$end"
    } >> "$tmp"
    mv "$tmp" "$bbappend"
}
