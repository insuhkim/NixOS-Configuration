{ ... }:
{
  flake.nixosModules.mango =
    { pkgs, ... }:
    {
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
