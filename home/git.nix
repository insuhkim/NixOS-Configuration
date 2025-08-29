{
  programs.git = {
    enable = true;
    userName = "insuhkim";
    userEmail = "insuhkim@naver.com";
    delta.enable = true;
    # difftastic.enable = true;
    # diff-so-fancy.enable = true;
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status -sb";
      br = "branch";
      amend = "commit --amend";
      # ac = "add -A && commit -m";
      ac = "commit -am";
      unstage = "reset HEAD --";
      aliases = "!git config --get-regexp ^alias\\. | sed -e 's/^alias\\.//' -e 's/ / = /'";
      pushforce = "push --force-with-lease";
      branches = "branch -a";
      hist = "log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      type = "cat-file -t";
      dump = "cat-file -p";
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.default = "current";

      merge.conflictStyle = "zdiff3";
      diff.algorithm = "histogram";
      diff.colorMoved = "default";

      column.ui = "auto";
      branch.sort = "-committerdate";
      push.autoSetupRemote = true;
      rerere.enabled = true;
    };
  };
}
