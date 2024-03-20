# fundamentals.nix

let
GitRepo = { url, auth, path }:
Commit = { hash, message, author, timestamp, files }:
Timestamp = 1;
Hash = abcdef123456:
UserInfo = { name: john, email: "john@john.com" }:
Tag = { name: john, commit: Commit, tagger?: UserInfo, date?: Timestamp}:
MermaidDiagram = 
extractAttributes = builtins.fetchGit {
  url = "git@github.com:VentsislavDinev/nix-fundamentals.git";
  ref = "master";
  rev = "adab8b916a45068c044658c4158d81878f9ed1c3";
};
in 
extractAttributes



  ## Code block from a previous task for reference
  ## nimbleLock = builtins.fromJSON (builtins.readFile ./nimble.lock); #Read the contents of the nimble.lock file parse it as JSON
  ## getPackages = builtins.attrValues nimbleLock.packages; #Extract the values from the 'packages' attribute of the parsed nimbleLock
  ## builtins 
  ## extractAttributes = builtins.attrValues (builtins.mapAttrs (name: value: #Define a function to exctract attributes from each package
  ##    {
  ##    name = name; #Assign the 'name' attribute from the package to the same attribute in the result name = name;
  ##    hash = value.vcsRevision; #Assign the 'vcsRevision' attribute from the package as 'hash' in the resulthash = value.vcsRevision;
  ##    url = value.url; #Assign the 'url' attribute from the package to the same attribute in the result url = value.url;
  ##    }
  ## ) nimbleLock.packages
  ## ); in extractAttributes
