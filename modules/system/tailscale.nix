{ lib, config, ... }:
let
  cfg = config.base.system.tailscale;
in
{
  options.base.system.tailscale = {
    enable = lib.mkEnableOption "Enable tailscale";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;
    services.tailscale.useRoutingFeatures = "client";
  };
}
