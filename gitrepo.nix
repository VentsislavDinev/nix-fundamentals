# The functions below are GitRepo functions

# In this case the value of the geGitHubRepo is an object containing two fields
  getGitHubRepo = { 
    orgName = "metacraft-labs";
    repoName = "$(basename $(git rev-parse --show-toplevel))";
  };

  getBranches = { 
    repoName = "$(git rev-parse --show-toplevel)";
    branchName = "$(git branch | head -n 1)";
  };

  getCommits = { 
    repoName = "$(git rev-parse --show-toplevel)";
    commit_one = "$(git lg -n 1 --skip=3 --date-order)"; #Shows 231ab18 (Oldest Commit)
    commit_two = "$(git lg -n 1 --skip=2 --date-order)"; #Shows 73616ab 
    commit_three = "$(git lg -n 1 --skip=1 --date-order)"; #Shows 897ad29
    commit_four = "$(git lg -n 1 --date-order)"; #Shows 9db6651 (Newest Commit)
  };

  getTags = { 
    repoName = "$(git rev-parse --show-toplevel)";
    tagName_one = "$(git tag --list | sed -n 1p)"; #v1.0
    tagName_two = "$(git tag --list | sed -n 2p)"; #v1.1
    tagName_three = "$(git tag --list | sed -n 3p)"; #v1.3
  };

  generateMermaidVisualization = { 
    orgName = "metacraft-labs";
    repoName = "$(git rev-parse --show-toplevel)";
  };

# The functions below are Commit functions

# The hashes below are gotten by the git rev-parse {The_Name_Of_The_Commit}
# This command is used to convert a Git object name (like 231ab18) into a form that is readable and usable by other Git commands.
  getCommitHash = { 
    commit_one_hash = "$(git rev-parse $(commit_one))"; #Shows 231ab1829e9ef2433629e2b7c565370f63b4401b
    commit_two_hash = "$(git rev-parse $(commit_two))"; #Shows 73616ab9dfb1773d816ee53004f56795f87728e3
    commit_three_hash = "$(git rev-parse $(commit_three))"; #Shows 897ad292078780ef406a161d7925d0b0b9da126a
    commit_four_hash = "$(git rev-parse $(commit_four))"; #Shows 9db665144c2aa5313bd3f31e7596c77011645881
  };

  getParentCommits = {
    grandFather = "$(git log --pretty=format:%P -n 1 $(commit_one)^@) && echo -n 'This commit has no parent!'";
    normalFather = "$(git log --pretty=format:%P -n 1 $(commit_two)^@)"; #Shows 231ab1829e9ef2433629e2b7c565370f63b4401b
    normalSon = "$(git log --pretty=format:%P -n 1 $(commit_three)^@)"; #Shows 73616ab9dfb1773d816ee53004f56795f87728e3
    grandSon = "$(git log --pretty=format:%P -n 1 $(commit_four)^@)"; #Shows 897ad292078780ef406a161d7925d0b0b9da126a
  };

  getAuthor = { 
    author_of_first_commit = "$(git log -1 --format='%an' $(commit_one_hash))";
    author_of_second_commit = "$(git log -1 --format='%an' $(commit_two_hash))";
    author_of_third_commit = "$(git log -1 --format='%an' $(commit_three_hash))"
    author_of_fourth_commit = "$(git log -1 --format='%an' $(commit_four_hash))"
  };

  getCommiter = { 
    commiter_of_the_first_commit = "$(git log -1 --format='%cn' $(commit_one_hash))";
    commiter_of_the_second_commit = "$(git log -1 --format='%cn' $(commit_two_hash))";
    commiter_of_the_third_commit = "$(git log -1 --format='%cn' $(commit_three_hash))";
    commiter_of_the_fourth_commit = "$(git log -1 --format='%cn' $(commit_four_hash))";
  };

  getMessage = { 
    message_of_first_commit = "$(git log -1 --format='%s' $(commit_one_hash))";
    message_of_second_commit = "$(git log -1 --format='%s' $(commit_two_hash))";
    message_of_third_commit = "$(git log -1 --format='%s' $(commit_three_hash))";
    message_of_fourth_commit = "$(git log -1 --format='%s' $(commit_four_hash))";
  };

