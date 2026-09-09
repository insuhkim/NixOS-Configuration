{ lib, config, ... }:
let
  cfg = config.base.system.envfs;
in
{
  options.base.system.envfs = {
    enable = lib.mkEnableOption "Enable envfs";
  };

  config = lib.mkIf cfg.enable {
    services.envfs.enable = true;
  };
}
