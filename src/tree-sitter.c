#include "emscripten.h"
#include "tree_sitter/runtime.h"

EMSCRIPTEN_KEEPALIVE
int version() {
  return TREE_SITTER_LANGUAGE_VERSION;
}