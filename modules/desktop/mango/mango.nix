{ ... }:
{
  flake.nixosModules.mango =
    { inputs, pkgs, ... }:
    let
      mangoPackage = inputs.nix-wrapper-modules.wrappers.mangowc.wrap {
        inherit pkgs;
        package = pkgs.mango;
        sourcedFiles = [
          ./config/appearance.toml
          ./config/autostart.toml
          ./config/env.toml
          ./config/input.toml
          ./config/keybinds.toml
          ./config/layout.toml
          ./config/misc.toml
          ./config/monitors.toml
          ./config/rules.toml
        ];
        extraConfig = ''
          source_optional=~/.config/mango/noctalia.conf
        '';
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
