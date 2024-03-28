{pkgs ? import <nixpkgs> {}}: let ## Define a function taking an optional `pkgs` argument with a default value as the Nixpkgs collection
  nixosModulesGitRepo = pkgs.fetchgit {
    url = "https://github.com/metacraft-labs/nixos-modules.git"; ## The URL of the Git repository
    leaveDotGit = true; ## Whether to include the `.git` directory after cloning
    rev = "a152eee193046aed3a2aae3caae09033ff9831fb"; ## Revision (commit hash) to checkout
    hash = "sha256-AWKAhYUWxOy/edPoltm/kb8EXgdRFd6qfo+OGEz46QU="; ## Expected hash of the fetched content
    deepClone = true; ## Whether to perform a deep clone (including submodules)
  };

  gitLogResult = pkgs.runCommand "git-log-result" {} '' ## Run a command to get the Git log and store the result in a file
    mkdir $out ## Create the output directory
    cd ${nixosModulesGitRepo} ## Change directory to the fetched Git repository
    ${pkgs.git}/bin/git -c 'safe.directory=*' log > $out/result ## Run git log and store the result in a file
  '';

  str = builtins.readFile "${gitLogResult}/result"; ## Read the content of the Git log result file
in
  str ## Return the content of the Git log result file
