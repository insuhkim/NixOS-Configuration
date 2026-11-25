{ ... }: {
  flake.nixosModules.tailscale = { ... }: {
    services.tailscale.enable = true;
    services.tailscale.useRoutingFeatures = "client";
  };
}
