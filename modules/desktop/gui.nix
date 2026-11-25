{ ... }: {
  flake.nixosModules.gui = { inputs, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      webcord
      ferdium
      readest
      obsidian
      (inputs.nix-wrapper-modules.wrappers.kitty.wrap {
        inherit pkgs;
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
      })
    ];

    programs.localsend = {
      enable = true;
      openFirewall = true;
    };

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}
