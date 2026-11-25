_: {
  flake.nixosModules.bash = _: {
    programs.bash = {
      enable = true;
      shellAliases = {
        optimise = "nix-store --optimise -vv";
        zed = "zeditor";
        ls = "eza --icons";
        lt = "eza --icons --tree --level=2";
        ff = "fastfetch";
        cat = "bat";
        cd = "z";
      };

      blesh.enable = true;
      interactiveShellInit = ''
        source ${./.blerc}
      '';
    };
  };
}
