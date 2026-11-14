{ ... }:
{
  flake.nixosModules.nix =
    { pkgs, ... }:
    {
      nix.package = pkgs.lixPackageSets.stable.lix;
      services.envfs.enable = true;
    };
}
