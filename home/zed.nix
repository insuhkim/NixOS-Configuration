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
      userSettings = {
        terminal = {
          font_size = 15;
        };
        buffer_line_height = "comfortable";
        buffer_font_weight = 400;
        buffer_font_size = 16;
        icon_theme = {
          mode = "system";
          light = "Catppuccin Frappé";
          dark = "Catppuccin Frappé";
        };
        auto_update = false;
        which_key = {
          delay_ms = 100;
          enabled = true;
        };
        vim = {
          use_smartcase_find = true;
          use_system_clipboard = "never";
          toggle_relative_line_numbers = true;
        };
        project_panel = {
          dock = "left";
        };
        outline_panel = {
          dock = "left";
        };
        collaboration_panel = {
          dock = "left";
        };
        git_panel = {
          dock = "left";
        };
        ui_font_size = 16;
        theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Frappé";
        };
        vim_mode = true;
        languages = {
          Nix = {
            language_servers = [
              "nixd"
              "!nil"
            ];
          };
        };
        auto_install_extensions = {
          catppuccin = true;
          catppuccin-icons = true;
          nix = true;
        };
      };
    };
  };
}
