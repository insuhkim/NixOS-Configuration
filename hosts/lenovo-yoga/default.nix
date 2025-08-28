{ inputs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules."lenovo-yoga-7-14IAH7-hybrid"
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];
  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

}
