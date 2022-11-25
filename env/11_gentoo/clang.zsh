#!/usr/bin/env zsh

export PATH=$(grep "^PATH=" /etc/env.d/*llvm*([1]) | sed 's/.*=//' | sed 's/"//g'):$PATH
