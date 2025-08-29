{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      update-verbose = "sudo nixos-rebuild switch --show-trace --print-build-logs --verbose";
      nixgc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage --delete-old";
      why-installed = "nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o nix-tree";

      zed = "zeditor";
      ls = "eza --icons=auto";
      lt = "eza --icons=auto --tree --level=2";
      ff = "fastfetch";
      cat = "bat";
      grep = "rg";
      cd = "z";
      cbonsai = "cbonsai --live --infinite";
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
  programs.pay-respects = {
    enable = true;
  };

  # programs.tmux.enable = true;
  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
    # exitShellOnExit = true;
    #
    # settings = {
    #   theme = "catppuccin-frappe";
    # };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  programs.fastfetch = {
    enable = true;
  };
  programs.oh-my-posh = {
    enable = true;
  };
  programs.zoxide.enable = true;
  programs.lazygit.enable = true;
  home.packages = with pkgs; [
    fortune
    cowsay
    lolcat
    asciiquarium
    cbonsai
    cava

    nix-tree

    ripgrep
    dust
    btop
    fd
    fzf
    tldr
    yazi
    bat
    fastfetch
    eza
    delta
    zoxide
  ];
}
