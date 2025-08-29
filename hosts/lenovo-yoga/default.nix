{ inputs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules."lenovo-yoga-7-14IAH7-hybrid"

    ./../../configuration.nix
    ./../../modules
  ];

  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;
}
