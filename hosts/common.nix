{ inputs, userName, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = import ../home;
    extraSpecialArgs = { inherit inputs userName; };
    backupFileExtension = "hm.old";
  };
}
