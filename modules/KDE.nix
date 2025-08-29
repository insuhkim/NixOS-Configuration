{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-hangul
    ];
  };

  environment.systemPackages = with pkgs; [ wl-clipboard ];

  programs.kdeconnect.enable = true;
  networking.firewall =
    let
      allowedRange = {
        from = 1714;
        to = 1764;
      };
    in
    {
      allowedTCPPortRanges = [ allowedRange ];
      allowedUDPPortRanges = [ allowedRange ];
    };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # # Enable the X11 windowing system.
  # # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

  # # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };

  # # Enable CUPS to print documents.
  # services.printing.enable = true;

  # # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
