{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.base.desktop.kde;
in
{
  options.base.desktop.kde = {
    enable = lib.mkEnableOption "Enable KDE Plasma Desktop";
  };

  config = lib.mkIf cfg.enable {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-hangul
      ];
    };

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
