rec {
  stringValues = rec {
    path = ./string.nix;
    value = import ./string.nix;
    type = "string";
    checkFunction = builtins.isString;
    isCorrect = checkFunction value;
    isAlsoCorrect =
      if (builtins.isString value)
      then "yes"
      else "no";
  };

  integerValues = rec {
    path = ./integer.nix;
    value = import ./integer.nix;
    type = "integer";
    checkFunction = value: type.isInt value;
    isCorrect = checkFunction value;
  };

  booleanValues = rec {
    path = ./boolean.nix;
    value = import ./boolean.nix;
    type = "boolean";
    checkFunction = value: value == true || value == false;
    isCorrect = checkFunction value;
  };

  pathValues = rec {
    path = ./path.nix;
    value = import ./path.nix;
    type = "path";
    checkFunction = value: type.isPath value;
    isCorrect = checkFunction value;
  };

  nullValues = rec {
    path = ./null.nix;
    value = import ./null.nix;
    type = "null";
    checkFunction = value: type.isNull value;
    isCorrect = checkFunction value;
  };

  listValues = rec {
    path = ./list.nix;
    value = import ./list.nix;
    type = "list";
    checkFunction = value: type.isList value;
    isCorrect = checkFunction value;
  };

  attribute_setValues = rec {
    path = ./attribute-set.nix;
    value = import ./attribute-set.nix;
    type = "set";
    checkFunction = value: type.isAttrs value;
    isCorrect = checkFunction value;
  };

  functionValues = rec {
    path = ./function.nix;
    value = import ./function.nix;
    type = "function";
    checkFunction = value: type.isFunction value;
    isCorrect = checkFunction value;
  };

  derivationValues = rec {
    path = ./derivation.nix;
    value = import ./derivation.nix;
    type = "derivation";
    checkFunction = value: value ? "type" && value.type == "derivation";
    isCorrect = checkFunction value;
  };
}
