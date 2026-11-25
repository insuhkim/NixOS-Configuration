_: {
  flake.nixosModules.nix =
    { pkgs, ... }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nixpkgs.config.allowUnfree = true;

      nix.optimise.automatic = true;
      services.envfs.enable = true;
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
      };

      nix.package = pkgs.lixPackageSets.stable.lix;
    };
}
