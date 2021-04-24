{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     jetbrains.datagrip
     google-cloud-sdk
     master.zoom-us
     slack
  ];
}
