_: {
  flake.nixosModules.noctalia =
    {
      inputs,
      pkgs,
      lib,
      ...
    }:
    let
      configSources = [
        ./config/noctalia-config.toml
        ./config/wallpaper.toml
        ./config/widgets.toml
      ];

      parsedConfigs = map (file: fromTOML (builtins.readFile file)) configSources;
      settings = lib.foldl' lib.recursiveUpdate { } parsedConfigs;

      noctaliaPackage = inputs.nix-wrapper-modules.wrappers.noctalia.wrap {
        inherit pkgs settings;
      };
    in
    {
      programs.noctalia = {
        enable = true;
        package = noctaliaPackage;
        systemd.enable = true;
        recommendedServices.enable = true;
      };

      environment.systemPackages = with pkgs; [
        wl-clipboard
        capitaine-cursors
        wlr-randr
        # for wallpaper depth plugin
        (python3.withPackages (
          ps: with ps; [
            numpy
            onnxruntime
            pillow
          ]
        ))
      ];

      services.displayManager.noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ "insuhkim" ];
        settings = {
          cursor.size = 36;
          keyboard.layout = "us";
        };
        cursorTheme = {
          package = pkgs.capitaine-cursors;
          name = "capitaine-cursors";
        };
      };

      # services.gnome.gnome-keyring.enable = true;
      # security.pam.services.login.enableGnomeKeyring = true;
    };
}
