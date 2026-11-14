{ lib, ... }:
{
  systemd.defaultUnit = lib.mkForce "multi-user.target";
  networking.networkmanager.wifi.powersave = lib.mkForce false;

  # systemd.services."getty@tty1".enable = lib.mkForce true;
}
