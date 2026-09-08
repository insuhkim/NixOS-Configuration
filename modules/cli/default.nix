{ inputs, ... }:
{
  imports = [
    ./terminal.nix
    inputs.nix-index-database.nixosModules.default
  ];
}
