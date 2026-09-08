{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  cfg = config.base.gui.steam;
in
{
  options.base.gui.steam = {
    enable = lib.mkEnableOption "Enable steam";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      # steam-run
      # hydralauncher
    ];

    nixpkgs.overlays = [
      inputs.millennium.overlays.default
    ];

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      package = pkgs.millennium-steam;
    };
  };
}
