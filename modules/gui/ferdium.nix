{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.base.gui.ferdium;
in
{
  options.base.gui.ferdium = {
    enable = lib.mkEnableOption "Enable ferdium";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.ferdium ];
  };
}
