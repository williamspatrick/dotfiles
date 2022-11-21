" vim-gh-line config
let g:gh_github_domain = "openbmc.gerrit"
if has('mac') || has('macunix') || has('gui_macvim')
    let g:gh_open_command = 'unsetopt nomatch; fn() { echo "$@" | sed "s#ssh://openbmc.gerrit#https://github.com#" | xargs open }; fn '
else
    let g:gh_open_command = 'unsetopt nomatch; fn() { echo "$@" | sed "s#ssh://openbmc.gerrit#https://github.com#" | xargs xdg-open }; fn '
endif
let g:gh_cgit_url_pattern_sub = [
    \ ['.\+git.kernel.org/', 'https://git.kernel.org/' ],
    \ ['.\+git.yoctoproject.org/', 'https://git.yoctoproject.org/' ],
    \ ['.\+git.qemu.org/', 'https://git.qemu.org/' ],
\ ]
