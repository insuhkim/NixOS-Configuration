{
  lib,
  config,
  ...
}:
let
  cfg = config.base.system.audio.pipewire;
in
{
  options.base.system.audio.pipewire = {
    enable = lib.mkEnableOption "Enable pipewire audio";
  };

  config = lib.mkIf cfg.enable {
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    hardware.alsa.enablePersistence = true;
  };
}
