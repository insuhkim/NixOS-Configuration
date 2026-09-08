{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.base.gui.readest;
in
{
  options.base.gui.readest = {
    enable = lib.mkEnableOption "Enable readest";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ readest ];
  };
}
