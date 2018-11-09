#include <emscripten.h>
#include <string.h>
#include "tree_sitter/runtime.h"

// Declare the `tree_sitter_json` function, which is
// implemented by the `tree-sitter-json` library.
extern "C" TSLanguage * tree_sitter_json();

EMSCRIPTEN_KEEPALIVE
int version() {
  return TREE_SITTER_LANGUAGE_VERSION;
}

EMSCRIPTEN_KEEPALIVE
TSTree* parse(char* source_code) {
  TSParser *parser = ts_parser_new();

  // Set the parser's language (JSON in this case).
  ts_parser_set_language(parser, tree_sitter_json());

  // Build a syntax tree based on source code stored in a string.
  return ts_parser_parse_string(
    parser,
    NULL,
    source_code,
    strlen(source_code)
  );
}
