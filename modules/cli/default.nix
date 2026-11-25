{ self, ... }:
{
  flake.nixosModules.cli = { inputs, pkgs, ... }: {
    imports =
      with self.nixosModules;
      [
        starship
        git
        jujutsu
        yazi
        bash
      ]
      ++ [ inputs.nix-index-database.nixosModules.default ];
    programs.nix-index-database.comma.enable = true;

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
