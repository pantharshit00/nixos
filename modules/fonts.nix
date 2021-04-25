{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "JetBrains Mono"
        ];
      };
    };
    fonts = with pkgs; [
      corefonts
      inconsolata
      ubuntu_font_family
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      jetbrains-mono
      fira-code
      fira-code-symbols
      mplus-outline-fonts
      dina-font
      proggyfonts
      awesome
      dejavu_fonts
      nerdfonts
      hack-font
    ];
  };
}
