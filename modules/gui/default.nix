{ self, ... }:
{
  flake.nixosModules.gui =
    { pkgs, ... }:
    {
      imports = with self.nixosModules; [
        kitty
        zen-browser
      ];

      environment.systemPackages = with pkgs; [
        webcord
        ferdium
        readest
        obsidian
        zed-editor-fhs
      ];

      programs.localsend = {
        enable = true;
        openFirewall = true;
      };

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      };
    };
}
