# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  imports =
    [ 
      inputs.nixos-hardware.nixosModules.common-cpu-intel
      (modulesPath + "/installer/scan/not-detected.nix")
      ../modules/common.nix
      ../modules/virtualization.nix
      ../modules/fonts.nix
      ../modules/dev.nix
      ../modules/multimedia.nix
      ../modules/work.nix
      ../modules/xorg.nix
      ../modules/laptop.nix
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "nvidia-drm" "modeset=1" "intel_pstate=passive" ];
  boot.extraModulePackages = with pkgs; [ nvidia_x11 ];
  
  services.sshd.enable = true;
  services.xserver = {
    videoDrivers = [ "nvidia" ];
		config = ''
			Section "Screen"
					Identifier     "Screen0"
					Device         "Device0"
					Monitor        "Monitor0"
					DefaultDepth   24
					Option         "Stereo" "0"
					Option         "nvidiaXineramaInfoOrder" "DFP-5"
					Option         "metamodes" "nvidia-auto-select +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
					Option         "SLI" "Off"
					Option         "MultiGPU" "Off"
					Option         "BaseMosaic" "off"
					SubSection     "Display"
					Depth          24
					EndSubSection
			EndSection
		'';
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    opengl.enable = true;
    nvidia = {
      modesetting.enable = true;
      package = pkgs.nvidia_x11;
    };
  };
  networking = {
   hostId = "6A449A82";
   hostName = "ylaptop";
  };
  powerManagement.cpuFreqGovernor = "performance";

  fileSystems."/" =
    { device = "zroot/root/nixos";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "zroot/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0E00-AAA5";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/ae21e022-5782-493c-a01f-d50081164a64"; }
    ];
}
