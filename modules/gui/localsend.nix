{
  lib,
  config,
  ...
}:
let
  cfg = config.base.gui.localsend;
in
{
  options.base.gui.localsend = {
    enable = lib.mkEnableOption "Enable localsend";
  };

  config = lib.mkIf cfg.enable {
    programs.localsend = {
      enable = true;
      openFirewall = true;
    };
  };
}
