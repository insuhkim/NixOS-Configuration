{ inputs, ... }: {
  flake.nixOnDroidConfigurations.default = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
    pkgs = import inputs.nixpkgs-stable { system = "aarch64-linux"; };
    modules = [ ../droid ];
  };
}
