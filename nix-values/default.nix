rec
{
  stringValues = rec {
    path = ./string.nix;
    value = import ./string.nix;
    type = "string";
    checkFunction = builtins.isString;
    isCorrect = checkFunction value;
  };

  integerValues = rec {
    path = ./integer.nix;
    value = import ./integer.nix;
    type = "integer";
    checkFunction = builtins.isInt;
    isCorrect = checkFunction value;
  };

  booleanValues = rec {
    path = ./boolean.nix;
    value = import ./boolean.nix;
    type = "boolean";
    checkFunction = builtins.isBool;
    isCorrect = checkFunction value;
  };

  pathValues = rec {
    path = ./path.nix;
    value = import ./path.nix;
    type = "path";
    checkFunction = builtins.isPath;
    isCorrect = checkFunction value;
  };

  nullValues = rec {
    path = ./null.nix;
    value = import ./null.nix;
    type = "null";
    checkFunction = isNull;
    isCorrect = checkFunction value;
  };

  listValues = rec {
    path = ./list.nix;
    value = import ./list.nix;
    type = "list";
    checkFunction = builtins.isList;
    isCorrect = checkFunction value;
  };

  attribute_setValues = rec {
    path = ./attribute-set.nix;
    value = import ./attribute-set.nix;
    type = "set";
    checkFunction = builtins.isAttrs;
    isCorrect = checkFunction value;
  };

  functionValues = rec {
    path = ./function.nix;
    value = import ./function.nix;
    type = "function";
    checkFunction = builtins.isFunction;
    isCorrect = checkFunction value;
  };

  derivationValues = {lib}: rec {
    path = ./derivation.nix;
    value = import ./derivation.nix;
    type = "derivation";
    checkFunction = value: lib.isDerivation value;
    isCorrect = checkFunction value;
  };

    special_attribute_setValues = rec {
    path = ./special.nix;
    value = import ./special.nix;
    type = "set";
    checkFunction = builtins.isAttrs;
    isCorrect = checkFunction value;
  };

    task_attribute_setValues = rec {
    path = ./task.nix;
    value = import ./task.nix;
    type = "set";
    checkFunction = builtins.isAttrs;
    isCorrect = checkFunction value;
  };
}

