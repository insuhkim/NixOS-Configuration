{ lib, config, ... }:
let
  cfg = config.base.programs.tailscale;
in
{
  options.base.programs.tailscale = {
    enable = lib.mkEnableOption "Enable tailscale";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;
    services.tailscale.useRoutingFeatures = "client";
  };
}
