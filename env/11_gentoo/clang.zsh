#!/usr/bin/env zsh

export PATH=$(echo $PATH | sed "s#:[^:]*llvm[^:]*##g"):$(grep "^PATH=" /etc/env.d/*llvm*([1]) | sed 's/.*=//' | sed 's/"//g')
