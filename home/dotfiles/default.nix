{
  xdg.configFile."blesh/init.sh".source = ./.blerc;
  xdg.configFile."starship.toml".source = ./starship.toml;
  xdg.configFile."mango" = {
    source = ./mango;
    recursive = true;
  };
}
