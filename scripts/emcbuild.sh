#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

emcc -O3 \
    -s WASM=1 \
    -s EXTRA_EXPORTED_RUNTIME_METHODS='["cwrap"]' \
    -I ext/tree-sitter/include \
    -I ext/tree-sitter/src \
    -I ext/tree-sitter/externals/utf8proc \
    -I ext/tree-sitter/externals/json-parser \
    -o build/tree-sitter.js \
    src/tree-sitter.c \
    ext/tree-sitter/src/**/*.c