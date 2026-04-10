{ lib, config, ... }:
let
  cfg = config.myHome.programs.zed;
in
{
  options.myHome.programs.zed = {
    enable = lib.mkEnableOption "Enable zed editor";
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "catppuccin"
        "catppuccin-icons"
      ];
    };
  };
}
