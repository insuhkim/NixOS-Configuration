{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.base.desktop.mango;
in
{
  options.base.desktop.mango = {
    enable = lib.mkEnableOption "Enable Mango Window Manager";
  };

  config = lib.mkIf cfg.enable {

    programs.mango.enable = true;
    programs.noctalia.enable = true;
    programs.noctalia.recommendedServices.enable = true;

    environment.systemPackages = with pkgs; [
      wl-clipboard
      capitaine-cursors
    ];

    services.displayManager.noctalia-greeter = {
      enable = true;
      settings = {
        cursor.size = 36;
        keyboard.layout = "us";
      };
      cursorTheme = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
      };
    };

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;
  };
}
