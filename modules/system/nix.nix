{ ... }:
{
  flake.nixosModules.nix =
    { pkgs, ... }:
    {
      # Enable flakes
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nix.package = pkgs.lixPackageSets.stable.lix;
      services.envfs.enable = true;
    };
}
