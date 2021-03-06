{ pkgs, inputs, nixpkgs, config, lib, ... }:

rec {
  xdg.configFile = {
    "pictures".source = ./home/pictures;
    "wofi/style.css".source = ./home/wofi/style.css;
    "picom/config".source = ./home/picom/config;
    "dunst/dunstrc".source = ./home/dunst/dunstrc;
    "i3/config".source = ./home/i3/config;
    "nvim".source = ./home/nvim;
    "i3/i3status.toml".source = ./home/i3/i3status.toml;
    "i3/i3exit".source = ./home/i3/i3exit;
    "i3/i3subscribe".source = ./home/i3/i3subscribe;
    "scripts/battery.sh".source = ./home/scripts/battery.sh;
    "scripts/weather.sh".source = ./home/scripts/weather.sh;
    "scripts/cpu.pl".source = ./home/scripts/cpu.pl;
    "scripts/memory.sh".source = ./home/scripts/memory.sh;
    "scripts/temperature.sh".source = ./home/scripts/temperature.sh;
    "scripts/wifi.sh".source = ./home/scripts/wifi.sh;
    "scripts/dist.js".source = ./home/scripts/dist.js;
  };

  programs = {
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv ={
        enable = true;
      };
    };
    neovim = { vimAlias = true; };
    git = {
      enable = true;
      userName = "Harshit Pant";
      userEmail = "pantharshit00+github@gmail.com";
      extraConfig = { pull.rebase = true; };
      aliases = {
        co = "checkout";
        br = "branch";
        st = "status";
        cm = "commit";
      };
    };
    zsh = {
      enable = true;
      shellAliases = { vim = "nvim"; };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    alacritty = {
      enable = true;
      settings = {
        env = { TERM = "xterm-256color"; };
        scrolling = { history = 100000; };
        font = {
          normal = {
            family = "JetBrains Mono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Italic";
          };
          bold_italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold Italic";
          };
          size = 16.0;
        };
        colors = {
          primary = {
            background = "0x1b182c";
            foreground = "0xcbe3e7";
          };
          normal = {
            black = "0x100e23";
            red = "0xff8080";
            green = "0x95ffa4";
            yellow = "0xffe9aa";
            blue = "0x91ddff";
            magenta = "0xc991e1";
            cyan = "0xaaffe4";
            white = "0xcbe3e7";
          };
          "bright" = {
            "black" = "0x565575";
            "red" = "0xff5458";
            "green" = "0x62d196";
            "yellow" = "0xffb378";
            "blue" = "0x65b2ff";
            "magenta" = "0x906cff";
            "cyan" = "0x63f2f1";
            "white" = "0xa6b3cc";
          };
        };
      };
    };
  };

  xresources.properties = {
    "Xft.dpi" = 96;
    "Xft.antialias" = true;
    "Xft.hinting" = true;
    "Xft.rgba" = "rgb";
    "Xft.autohint" = false;
    "Xft.hintstyle" = "hintfull";
    "Xft.lcdfilter" = "lcddefault";
    "rofi.modi" = "run";
    "rofi.font" = "Inconsolata for Powerline 15";
    "!rofi.width" = 100;
    "!rofi.lines" = 5;
    "!rofi.columns" = 1;
    "rofi.opacity" = 80;
    "rofi.color-normal" = "#073642, #eee8d5, #002b36, #eee8d5, #073642";
    "rofi.color-urgent" = "#073642, #eee8d5, #002b36, #eee8d5, #073642";
    "rofi.color-active" = "#073642, #eee8d5, #002b36, #eee8d5, #073642";
    "rofi.color-window" = "#073642, #eee8d5";
    "!rofi.location" = 2;
    "!rofi.padding" = 25;
    "rofi.fuzzy" = false;
    "*background" = "#1d2021";
    "*foreground" = "#ebdbb2";
    "*color0" = "#282828";
    "*color8" = "#928374";
    "*color1" = "#cc241d";
    "*color9" = "#fb4934";
    "*color2" = "#98971a";
    "*color10" = "#b8bb26";
    "*color3" = "#d79921";
    "*color11" = "#fabd2f";
    "*color4" = "#458588";
    "*color12" = "#83a598";
    "*color5" = "#b16286";
    "*color13" = "#d3869b";
    "*color6" = "#689d6a";
    "*color14" = "#8ec07c";
    "*color7" = "#a89984";
    "*color15" = "#ebdbb2";
  };
}
