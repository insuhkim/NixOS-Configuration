{ ... }:
{
  flake.nixosModules.starship =
    { inputs, pkgs, ... }:
    let
      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
      package = inputs.nix-wrapper-modules.wrappers.starship.wrap {
        inherit pkgs settings;
      };
    in
    {
      programs.starship = {
        enable = true;
        inherit package settings;
      };
    };
}
