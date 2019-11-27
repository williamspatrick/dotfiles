#!/usr/bin/env zsh

export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
eval $(fwdproxy-config --format=sh curl | sed "s/^/export /")
