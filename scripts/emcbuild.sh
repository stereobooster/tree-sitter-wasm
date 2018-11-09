#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

em++ -O3 \
    -s WASM=1 \
    -s EXTRA_EXPORTED_RUNTIME_METHODS='["cwrap"]' \
    -std=c++14 \
    -I ext/tree-sitter/src \
    -I ext/tree-sitter/include \
    -I ext/tree-sitter/externals/utf8proc \
    -I ext/tree-sitter/externals/json-parser \
    -I ext/tree-sitter/externals/bandit \
    -I ext/tree-sitter/externals/crypto-algorithms \
    -o build/tree-sitter.js \
    ext/tree-sitter/src/**/*.cc \
    src/tree-sitter.cc \
    -g \
    -Wall \
    -Wextra \
    -Wno-unused-parameter \
    -Wno-unknown-pragmas