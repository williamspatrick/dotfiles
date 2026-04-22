#!/usr/bin/env zsh

export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"

#eval $(fwdproxy-config --format=sh curl | sed "s/^/export /")
export http_proxy=http://fwdproxy:8080
export https_proxy=http://fwdproxy:8080
export ftp_proxy=http://fwdproxy:8080
