{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "catppuccin"
      "catppuccin-icons"
    ];
    # userSettings = {

    # };
  };
}
