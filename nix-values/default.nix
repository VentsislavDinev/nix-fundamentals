rec {
  path = ./string.nix;
  value = import string.nix;
  type = "string";
  checkFunction = value: /* a function that checks whether the given `value` is of the correct type */;
  isCorrect = checkFunction value;
}

rec {
  path = ./integer.nix;
  value = import integer.nix;
  type = "integer";
  checkFunction = value: /* a function that checks whether the given `value` is of the correct type */;
  isCorrect = checkFunction value;
}

rec {
  path = ./boolean.nix;
  value = import ./boolean.nix;
  type = "boolean";
  checkFunction = value: /* a function that checks whether the given `value` is of the correct type */;
  isCorrect = checkFunction value;
}

rec {
  path = ./path.nix;
  value = import path.nix;
  type = "path";
  checkFunction = value: /* a function that checks whether the given `value` is of the correct type */;
  isCorrect = checkFunction value;
}

rec {
  path = ./null.nix;
  value = import ./null.nix;
  type = "null";
  checkFunction = value: /* a function that checks whether the given `value` is of the correct type */;
  isCorrect = checkFunction value;
}
