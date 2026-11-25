{pkgs, lib, ...} :
{
  home.packages = with pkgs; [ blesh ];

  programs.bash = {
    enable = true;

    initExtra = lib.mkMerge [
      (lib.mkBefore ''
        [[ $- == *i* ]] && source "$(blesh-share)"/ble.sh --attach=none
      '')

      (lib.mkAfter ''
        [[ ! ''${BLE_VERSION-} ]] || ble-attach
      '')
    ];
  };
}
