{ pkgs, ... }:
{
  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
    extraPackages = with pkgs; [
      gcc
    ];
  };
}
