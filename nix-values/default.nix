rec {
  path = ./string.nix;
  value = import string.nix;
  type = "string";
  checkFunction = value: value ? "type" && value.type == "string";
  isCorrect = checkFunction value;
}

rec {
  path = ./integer.nix;
  value = import integer.nix;
  type = "integer";
  checkFunction = value: value ? "type" && value.type == "integer";
  isCorrect = checkFunction value;
}

rec {
  path = ./boolean.nix;
  value = import ./boolean.nix;
  type = "boolean";
  checkFunction = value: value ? "type" && value.type == "boolean";
  isCorrect = checkFunction value;
}

rec {
  path = ./path.nix;
  value = import path.nix;
  type = "path";
  checkFunction = value: value ? "type" && value.type == "path";
  isCorrect = checkFunction value;
}

rec {
  path = ./null.nix;
  value = import ./null.nix;
  type = "null";
  checkFunction = value: value ? "type" && value.type == "null";
  isCorrect = checkFunction value;
}

rec {
  path = ./list.nix;
  value = import ./list.nix;
  type = "list";
  checkFunction = value: value ? "type" && value.type == "list";
  isCorrect = checkFunction value;
}

rec {
  path = ./attribute_set.nix;
  value = import ./attribute_set.nix;
  type = "set";
  checkFunction = value: value ? "type" && value.type == "set";
  isCorrect = checkFunction value;
}

rec {
  path = ./function.nix;
  value = import ./function.nix;
  type = "function";
  checkFunction = value: value ? "type" && value.type == "function";
  isCorrect = checkFunction value;
}

rec {
  path = ./derivation.nix;
  value = import ./derivation.nix;
  type = "derivation";
  checkFunction = value: value ? "type" && value.type == "derivation";
  isCorrect = checkFunction value;
}
