#!/usr/bin/env zsh

clang-env()
{
    export PATH="$HOME/homebrew/opt/llvm/bin:$PATH"
    export CC="$HOME/homebrew/opt/llvm/bin/clang"
    export CXX=${CC}++
}
