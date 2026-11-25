{ ... }:
{
  flake.nixosModules.jujutsu = { inputs, pkgs, ... }: {
    environment.systemPackages = [
      (inputs.nix-wrapper-modules.wrappers.jujutsu.wrap {
        inherit pkgs;
        settings = {
          user = {
            name = "insuhkim";
            email = "insuhkim@naver.com";
          };

          ui = {
            default-command = "log";
            diff-formatter = ":git";
          };
        };
      })
    ];
  };
}
