{ self, ... }:
{
  flake.nixosModules.cli = _: {
    imports = with self.nixosModules; [
      starship
      git
      jujutsu
      yazi
      cli-tools
    ];
  };
}
