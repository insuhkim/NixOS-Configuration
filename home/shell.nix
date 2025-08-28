{ pkgs, ... }:
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
    # prezto = {
    #   enable = true;
    # };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" # also requires `programs.git.enable = true;`
        "zoxide"
      ];
      theme = "robbyrussell";
    };
  };
  programs.pay-respects = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  programs.fastfetch = {
    enable = true;
  };
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
    btop
    tldr
    yazi
    bat
    fastfetch
    eza
    delta
    zoxide
  ];
}
