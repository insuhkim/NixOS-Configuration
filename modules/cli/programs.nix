{ ... }: {
  flake.nixosModules.cli = { inputs, pkgs, ... }: {
    imports = [ inputs.nix-index-database.nixosModules.default ];
    programs.nix-index-database.comma.enable = true;

    programs.bash = {
      enable = true;
      blesh.enable = true;
    };

    programs.zoxide.enable = true;
    programs.bat.enable = true;
    programs.yazi.enable = true;
    programs.lazygit.enable = true;

    environment.systemPackages = with pkgs; [
      fortune
      cowsay
      lolcat
      figlet
      toilet
      nms
      scc
      smassh
      wiper
      yt-dlp
      asciiquarium
      cbonsai
      cmatrix
      nyancat
      hollywood
      pipes
      peaclock
      cava
      tuxedo
      # sl # aalib # libcaca oneko
      mpv
      blanket
      lowfi
      # kew # rmpc

      dust
      btop
      delta
      eza
      fastfetch
      fd
      fzf
      gh
      ripgrep
      tealdeer
      zellij
      nixd
      nixfmt
      nix-output-monitor
      nh
      nix-tree
      devenv
      nix-fast-build
      antigravity-cli
      github-copilot-cli
      neovim
      helix
    ];
  };
}
