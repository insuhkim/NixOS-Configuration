{ pkgs, ... }:
{
  # Zsh configuration
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      update-verbose = "sudo nixos-rebuild switch --show-trace --print-build-logs --verbose";
      nixgc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage --delete-old";
      why-installed = "nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o nix-tree";

      zed = "zeditor";
      ls = "eza";
      lt = "eza --tree --level=2";
      ff = "fastfetch";
      cat = "bat";
      grep = "rg";
      cd = "z";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    prezto = {
      enable = true;
      editor.keymap = "vi";
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "prompt"
      ];
      # pmoduleDirs = [ "${config.home.homeDirectory}/.zprezto-contrib" ];
      # prompt = {
      #   theme = "agnoster";
      #   # pwdLength = "long";
      #   showReturnVal = true;
      # };
    };

    # antidote = { enable = true; plugins = [ "zsh-users/zsh-autosuggestions" "zsh-users/zsh-syntax-highlighting" "zsh-users/zsh-completions" "mattmc3/ez-compinit" "aloxaf/fzf-tab" # "romkatv/powerlevel10k" ]; };
    #
    # oh-my-zsh = { enable = true; plugins = [ "git" "zoxide" ]; theme = "robbyrussell"; };
  };

  # Terminal multiplexer
  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
    # exitShellOnExit = true;
    # settings = { theme = "catppuccin-frappe"; };
  };

  # Editors
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  # Prompt
  programs.oh-my-posh.enable = true;

  # CLI tools and fun utilities
  home.packages = with pkgs; [
    fortune
    cowsay
    lolcat
    asciiquarium
    cbonsai
    cava
    cmatrix
    toilet
    sl
    aalib # libcaca
    nyancat
    figlet
    hollywood
    nms
    peaclock
    pipes # pipes-rs

    oneko

    dust
    # bat ripgrep btop fd fzf tldr yazi fastfetch eza delta zoxide
  ];

  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.yazi.enable = true;
  programs.tealdeer.enable = true;
  programs.zoxide.enable = true;
  programs.lazygit.enable = true;
  programs.git.delta.enable = true;
  programs.eza = {
    enable = true;
    icons = "auto";
    colors = "auto";
    enableZshIntegration = true;
  };

  programs.fastfetch = {
    enable = true;
  };
  # programs.pay-respects = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-storm";
      vim_keys = true;
      update_ms = 1000;
      proc_tree = true;
      # disks_filter = "/ /boot /nix /tmp /swap";
      # rounded_corners = false;
    };
  };
}
