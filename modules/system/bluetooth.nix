{ lib, config, ... }:
let
  cfg = config.base.system.bluetooth;
in
{
  options.base.system.bluetooth = {
    enable = lib.mkEnableOption "Enable bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          # Shows battery charge of connected devices on supported
          # Bluetooth adapters. Defaults to 'false'.
          Experimental = true;

          # # When enabled other devices can connect faster to us, however
          # # the tradeoff is increased power consumption. Defaults to
          # # 'false'.
          # FastConnectable = true;
        };
      };
    };
  };
}
