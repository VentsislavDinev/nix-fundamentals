# fundamentals.nix

let
  nimbleLock = builtins.fromJSON (builtins.readFile ./nimble.lock); #Read the contents of the nimble.lock file parse it as JSON
  getPackages = builtins.attrValues nimbleLock.packages; #Extract the values from the 'packages' attribute of the parsed nimbleLock
  builtins 
 
  extractAttributes = builtins.attrValues (builtins.mapAttrs (name: value: #Define a function to exctract attributes from each package
    {
      name = name; #Assign the 'name' attribute from the package to the same attribute in the result name = name;
      hash = value.vcsRevision; #Assign the 'vcsRevision' attribute from the package as 'hash' in the resulthash = value.vcsRevision;
      url = value.url; #Assign the 'url' attribute from the package to the same attribute in the result url = value.url;
    }
) nimbleLock.packages
); in extractAttributes
