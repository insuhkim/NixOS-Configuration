{ ... }: {
  flake.nixosModules.variables = { ... }: {
    environment.variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
