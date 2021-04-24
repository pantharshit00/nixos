{ config, lib, pkgs, ... }:

{
  services = {
    tlp = {
      enable = true;
      settings = {
        TLP_ENABLE = 1;
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 75;
        STOP_CHARGE_THRESH_BAT1 = 80;
        RESTORE_THRESHOLDS_ON_BAT = 1;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth wwan";
        DEVICES_TO_ENABLE_ON_STARTUP = "wifi";
      };
    };
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "shedutil";
  };

  networking = {
    wireless.iwd.enable = true;
    networkmanager = {
      wifi.backend = "iwd";
      wifi.powersave = true;
    };
  };
}
