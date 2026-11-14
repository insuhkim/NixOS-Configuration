{ ... }:
{
  flake.nixosModules.kde =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ wl-clipboard ];

      programs.kdeconnect.enable = true;
      networking.firewall =
        let
          allowedRange = {
            from = 1714;
            to = 1764;
          };
        in
        {
          allowedTCPPortRanges = [ allowedRange ];
          allowedUDPPortRanges = [ allowedRange ];
        };

      # Enable the KDE Plasma Desktop Environment.
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;
    };
}
