{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.base.programs.nixtools;
in
{
  options.base.programs.nixtools = {
    enable = lib.mkEnableOption "Enable nix tools";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nixd
      nixfmt
      nix-output-monitor
      nh
    ];
  };
}
