#!/usr/bin/env zsh

clang-env()
{
    export PATH="$HOME/.brew/opt/llvm/bin:$PATH"
    export CC="$HOME/.brew/opt/llvm/bin/clang"
    export CXX=${CC}++
}
