{ ... }: {
  flake.nixosModules.ttyd = {
    services.ttyd = {
      enable = true;
      port = 7681;
      interface = "tailscale0";

      entrypoint = [
        "/run/current-system/sw/bin/login"
      ];

      user = "root";
      writeable = true;
      clientOptions = {
        fontFamily = "JetBrainsMono Nerd Font";
        fontSize = "16";
        theme = builtins.toJSON {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
          cursor = "#f5e0dc";
        };
      };
    };
  };
}
