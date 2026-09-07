{pkgs, ...}: {
  programs.bash = {
    enable = true;
    blesh.enable = true;
  };

  programs.starship.enable = true;
}
