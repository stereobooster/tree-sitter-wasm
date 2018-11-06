const Module = require("../build/tree-sitter");

Module.onRuntimeInitialized = async _ => {
  const api = {
    version: Module.cwrap("version", "number", [])
  };
  console.log(api.version());
};
