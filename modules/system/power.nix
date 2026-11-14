{ ... }:
{
  flake.nixosModules.power = { ... }: {
    powerManagement = {
      enable = true;
      powertop.enable = true;
    };
    services.upower.enable = true;

    # Enable TLP battery management
    services.power-profiles-daemon.enable = false;
    services.tlp.enable = true;
  };
}
