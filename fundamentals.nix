# fundamentals.nix
let 
  GitRepo = { ## Define a set of attributes for a Git repository.
    url,
    auth,
    path,
  }: {inherit url auth path;}; ## Inherit attributes from the argument list.
  Commit = { ## Define a set of attributes for a commit.
    hash,
    message,
    author,
    timestamp,
    files,
  }: {inherit hash message author timestamp files;}; ## Inherit attributes from the argument list.
  Timestamp = 1;
  Hash = "abcdef123456";
  UserInfo = {
    name ? "john",
    email ? "john@john.com",
  }: {inherit name email;}; ## Inherit attributes from the argument list.
  Tag = {
    name ? UserInfo.name,
    commit ? Commit,
    tagger ? UserInfo,
    date ? Timestamp,
  }: {inherit name commit tagger date;}; ## Inherit attributes from the argument list.
  MermaidDiagram = "some_string";
  # extractAttributes = builtins.fetchGit {
  #   url = "";
  #   ref = "";
  #   rev = "";
  # };
in {
  inherit ## Inherit attributes defined above.
    # extractAttributes
    GitRepo
    Commit
    Timestamp
    Hash
    UserInfo
    Tag
    MermaidDiagram
    ;
}

