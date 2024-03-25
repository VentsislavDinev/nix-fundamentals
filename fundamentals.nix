# fundamentals.nix
let
  GitRepo = {
    url,
    auth,
    path,
  }: {inherit url auth path;};
  Commit = {
    hash,
    message,
    author,
    timestamp,
    files,
  }: {inherit hash message author timestamp files;};
  Timestamp = 1;
  Hash = "abcdef123456";
  UserInfo = {
    name ? "john",
    email ? "john@john.com",
  }: {inherit name email;};
  Tag = {
    name ? UserInfo.name,
    commit ? Commit,
    tagger ? UserInfo,
    date ? Timestamp,
  }: {inherit name commit tagger date;};
  MermaidDiagram = "some_string";
  # extractAttributes = builtins.fetchGit {
  #   url = "";
  #   ref = "";
  #   rev = "";
  # };
in {
  inherit
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

#GitRepo functions

#* getGitHubRepo :: { orgName: string, repoName: string } -> GitRepo 
#* getBranches :: (repo: GitRepo) → [ string ] 
#* getCommits :: (repo: GitRepo) → (branchName: string) → [ Commit ] 
#* getTags :: (repo: GitRepo) → [ Tag ] 
#* generateMermaidVisualization :: GitRepo → MermaidDiagram 

#Commit functions

#* getCommitHash :: Commit → Hash 
#* getParentCommits :: Commit → [ Commit ] 
#* getAuthor :: Commit → UserInfo 
#* getCommitter :: Commit → UserInfo 
#* getMessage :: Commit → { title: string, body: string } 