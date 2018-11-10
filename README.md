# tree-sitter-wasm

To build it locally you need `docker`

```sh
docker run --rm -v $(pwd):/src -t apiaryio/emcc:1.38.11 scripts/emcbuild.sh
```

To test it locally you need `node`

```
node --expose-wasm test/tree-sitter.test.js
```

## inspiration

- https://github.com/tree-sitter/tree-sitter/blob/master/docs/section-2-using-parsers.md
- https://github.com/apiaryio/drafter.js/blob/master/scripts/emcbuild.sh
- https://developer.mozilla.org/en-US/docs/WebAssembly/existing_C_to_wasm
- https://github.com/tree-sitter/tree-sitter-cli
- https://github.com/tree-sitter/node-tree-sitter
- https://github.com/apiaryio/emscripten-docker
- https://github.com/appcypher/awesome-wasm-langs#c
- https://webassembly.org/docs/c-and-c++/
