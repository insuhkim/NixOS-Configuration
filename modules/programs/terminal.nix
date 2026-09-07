{ pkgs, ... }:
{
  # CLI tools and fun utilities
  environment.systemPackages = with pkgs; [
    fortune
    cowsay
    lolcat
    figlet
    toilet
    nms

    asciiquarium
    cbonsai
    cmatrix
    nyancat
    hollywood
    pipes
    peaclock
    cava
    # sl # aalib # libcaca
    # oneko

    dust
    btop
    delta
    eza
    fastfetch
    fd
    fzf
    ripgrep
    tealdeer
    zellij
    # bat ripgrep btop fd fzf tldr yazi fastfetch eza delta zoxide
  ];

  programs.zoxide.enable = true;
  programs.bat.enable = true;
  programs.yazi.enable = true;
  programs.lazygit.enable = true;
}
