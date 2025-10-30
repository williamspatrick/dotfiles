#!/usr/bin/env zsh

clang-env() {
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export CC="/opt/homebrew/opt/llvm/bin/clang"
    export CXX=${CC}++
}
