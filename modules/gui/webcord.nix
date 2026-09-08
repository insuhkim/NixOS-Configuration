{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.base.gui.webcord;
in
{
  options.base.gui.webcord = {
    enable = lib.mkEnableOption "Enable webcord";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ webcord ];
  };
}
