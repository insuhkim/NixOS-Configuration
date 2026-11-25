_: {
  flake.nixosModules.yazi = { pkgs, ... }: {
    programs.yazi = {
      enable = true;
      plugins = with pkgs.yaziPlugins; {
        inherit
          smart-enter
          git
          full-border
          toggle-pane
          smart-filter
          diff
          ;
      };
      initLua = ./init.lua;
      settings.yazi = {
        plugin.prepend_fetchers = [
          {
            url = "*";
            run = "git";
            group = "git";
          }
          {
            url = "*/";
            run = "git";
            group = "git";
          }
        ];
      };
      settings.keymap = {
        mgr.prepend_keymap = [
          {
            on = [ "l" ];
            run = "plugin smart-enter";
            desc = "Enter directory or open file";
          }
          {
            on = [ "f" ];
            run = "plugin smart-filter";
            desc = "Smart filter";
          }
          {
            on = [ "T" ];
            run = "plugin toggle-pane min-preview";
            desc = "Maximize preview";
          }
          {
            on = [ "<C-d>" ];
            run = "plugin diff";
            desc = "Diff the selected with the hovered file";
          }
        ];
      };
    };
  };
}
