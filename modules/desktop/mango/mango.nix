{ ... }:
{
  flake.nixosModules.mango =
    { inputs, pkgs, ... }:
    let
      mangoPackage = inputs.nix-wrapper-modules.wrappers.mangowc.wrap {
        inherit pkgs;
        package = pkgs.mango;
        sourcedFiles = [
          ./config/appearance.conf
          ./config/autostart.conf
          ./config/env.conf
          ./config/input.conf
          ./config/keybinds.conf
          ./config/layout.conf
          ./config/misc.conf
          ./config/monitors.conf
          ./config/rules.conf
        ];
      };
    in
    {
      programs.mango = {
        enable = true;
        package = mangoPackage;
      };
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
