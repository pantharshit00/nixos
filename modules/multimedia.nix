{ config, lib, pkgs, ... }:

{
  sound.enable = true;
  security.rtkit.enable = true;

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;

      media-session.config.bluez-monitor = {
        properties = {
          bluez5.codecs = ["ldac" "aptx_hd"];
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
     ncmpcpp
     youtube-dl
     ffmpeg
		 obs-studio
     flac
     spotify
     mpv
     evince
     gnome3.eog
     deadbeef
  ];
}
