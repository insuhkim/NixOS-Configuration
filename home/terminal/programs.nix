{ pkgs, ... }:
{
  # Terminal multiplexer
  programs.zellij = {
    enable = true;
  };

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
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    colors = "auto";
    enableZshIntegration = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.btop = {
    enable = true;
    # settings = { color_theme = "tokyo-storm"; vim_keys = true; update_ms = 1000; proc_tree = true; };
  };
}
