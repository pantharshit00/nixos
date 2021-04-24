{ config, lib, pkgs, ... }:

{
  programs.dconf.enable = true;
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      gdm.enable = true;
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        firefox
        libinput
        rofi
        i3status
        i3lock
        i3blocks-gaps
        feh
        dunst
        scrot
        imagemagick
        picom
        xorg.xinput
        xorg.setxkbmap
        xorg.xset
        xorg.xrdb
        xorg.xinit
        xorg.libxcb
      ];
      extraSessionCommands = ''
        export HASS_SERVER="http://hass.local:8123";
        source /etc/nixos/secret/secret;
      '';
    };
  };
}
