_: {
  flake.nixosModules.user =
    _:
    let
      userName = "insuhkim";
    in
    {
      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.${userName} = {
        isNormalUser = true;
        description = userName;
        initialPassword = "password";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = [ ];
      };
    };
}
