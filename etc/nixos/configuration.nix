{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./minimal.nix
    ];

  boot.extraModulePackages = [ ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "uas" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.supportedFilesystems = [ "ext4" ];
  systemd.defaultUnit = "multi-user.target";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  networking.useDHCP = lib.mkDefault true;
  
  console = {
    keyMap = "slovene";
  };
  time.timeZone = "Europe/Ljubljana";

  environment.systemPackages = with pkgs; [ vim ];

  services.openssh.enable = false;
  services.avahi.enable = false;

  system.extraDependencies = [];
  system.stateVersion = "24.05";
}

