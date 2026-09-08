{ lib, config, ... }:
let
  cfg = config.myHome.programs.git;
in
{
  options.myHome.programs.git = {
    enable = lib.mkEnableOption "Enable git configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user.name = "insuhkim";
        user.email = "insuhkim@naver.com";

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

        alias = {
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
      };
    };

    programs.gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
  };
}
