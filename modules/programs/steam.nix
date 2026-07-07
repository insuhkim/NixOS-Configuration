{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  cfg = config.base.programs.steam;
in
{
  options.base.programs.steam = {
    enable = lib.mkEnableOption "Enable steam";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      steam-run
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
