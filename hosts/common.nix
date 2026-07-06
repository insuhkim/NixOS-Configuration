{ inputs, userName, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userName} = {
    isNormalUser = true;
    description = userName;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = import ../home;
    extraSpecialArgs = { inherit inputs userName; };
    backupFileExtension = "hm.old";
  };
}
