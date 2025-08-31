{ pkgs, ... }:
{
  # programs.obsidian = {
  #   enable = true;
  # };
  home.packages = with pkgs; [ obsidian ];
}
