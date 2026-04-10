{
  lib,
  config,
  ...
}:
let
  cfg = config.base.system.variables;
in
{
  options.base.system.variables = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable default environment variables";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
