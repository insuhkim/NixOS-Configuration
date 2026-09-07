{pkgs, ...}: {
  programs.bash = {
    enable = true;
    blesh.enable = true;
  };

  programs.starship.enable = true;

  programs.zoxide.enable = true;
  programs.bat.enable = true;
  programs.yazi.enable = true;
  programs.lazygit.enable = true;

  # CLI tools and fun utilities
  environment.systemPackages = with pkgs; [
    fortune cowsay lolcat figlet toilet nms
    asciiquarium cbonsai cmatrix nyancat hollywood pipes peaclock cava
    # sl # aalib # libcaca
    # oneko

    dust btop delta eza fastfetch fd fzf ripgrep tealdeer zellij

    nixd nixfmt nix-output-monitor nh nix-tree devenv
  ];
}
