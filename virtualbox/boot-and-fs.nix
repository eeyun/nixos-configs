{ config, lib, pkgs, ...}:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.checkJournalingFS = false;
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    devices = ["/dev/sda"];
  };
    
  boot.supportedFilesystems = ["zfs"];

  networking.hostId = lib.mkDefault "8425e349";
  
  fileSystems."/" = {
    device = "rpool/root/nixos";
    fsType "zfs";
  };

  fileSystems."/home" = {
      device = "rpool/home";
      fsType = "zfs";
    };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0c374018-07a4-4354-9d05-b63f3a1da98b";
    fsType = "ext4";
  };

  swapDevices = [ ];
  
  nix.maxJobs = lib.mkDefault 1;
  virtualisation.virtualbox.guest.enable = true;
}
