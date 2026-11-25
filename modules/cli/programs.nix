{ ... }: {
  flake.nixosModules.cli-tools = { inputs, pkgs, ... }: {
    imports = [ inputs.nix-index-database.nixosModules.default ];
    programs.nix-index-database.comma.enable = true;

    programs.bash = {
      enable = true;
      blesh.enable = true;
      shellAliases = {
        optimise = "nix-store --optimise -vv";
        zed = "zeditor";
        ls = "eza --icons";
        lt = "eza --icons --tree --level=2";
        ff = "fastfetch";
        cat = "bat";
        cd = "z";
      };
    };

    programs.zoxide.enable = true;
    programs.bat.enable = true;
    programs.lazygit.enable = true;

    environment.systemPackages = with pkgs; [
      # fortune cowsay lolcat figlet toilet nms smassh asciiquarium cbonsai cmatrix nyancat hollywood pipes
      # sl aalib libcaca oneko
      peaclock cava tuxedo mpv blanket lowfi yt-dlp wiper scc
      # kew rmpc

      dust btop delta eza fastfetch fd fzf gh ripgrep tealdeer zellij
      nixd nixfmt nix-output-monitor nh nix-tree nix-fast-build devenv
      antigravity-cli github-copilot-cli
      neovim
    ];
  };
}
