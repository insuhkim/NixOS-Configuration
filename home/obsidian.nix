{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.myHome.programs.obsidian;
in
{
  options.myHome.programs.obsidian = {
    enable = lib.mkEnableOption "Enable obsidian";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ obsidian ];
  };
}
