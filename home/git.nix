{
  programs.git = {
    enable = true;
    userName = "insuhkim";
    userEmail = "insuhkim@naver.com";
    # delta.enable = true;
    # difftastic.enable = true;
    diff-so-fancy.enable = true;
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status -sb";
      br = "branch";
      # hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
      hist = "log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      type = "cat-file -t";
      dump = "cat-file -p";
    };
  };
}
