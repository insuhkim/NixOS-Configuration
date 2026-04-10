{ lib, config, ... }:
let
  cfg = config.myHome.programs.kitty;
in
{
  options.myHome.programs.kitty = {
    enable = lib.mkEnableOption "Enable kitty terminal";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "JetbrainsMono Nerd Font Mono";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = 11.0;

        disable_ligatures = "never";
        scrollback_lines = 2000;

        enable_audio_bell = "no";
        cursor_trail = 1;
      };
    };
  };
}
