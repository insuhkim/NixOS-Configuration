_: {
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
    };
}
