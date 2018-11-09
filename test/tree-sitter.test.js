const Module = require("../build/tree-sitter");

Module.onRuntimeInitialized = async _ => {
  const api = {
    version: Module.cwrap("version", "number", []),
    parse: Module.cwrap("parse", "number", [])
  };
  console.log(api.version());
  console.log(api.parse("[1]"));
};
