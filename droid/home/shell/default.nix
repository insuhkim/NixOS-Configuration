{pkgs, lib, ...} :
{
  imports = [ 
    ./blesh.nix 
    ./starship.nix
  ];

  programs.bash = {
    initExtra = builtins.readFile ./.bashrc;
  };
}
