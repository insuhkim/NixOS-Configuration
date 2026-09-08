{ lib, config, ... }:
let
  cfg = config.base.system.power;
in
{
  options.base.system.power = {
    enable = lib.mkEnableOption "Enable power management";
  };

  config = lib.mkIf cfg.enable {
    powerManagement = {
      enable = true;
      powertop.enable = true;
    };
    services.upower.enable = true;

    # # Enable TLP battery management
    # services.power-profiles-daemon.enable = false;
    # services.tlp.enable = true;
  };
}
