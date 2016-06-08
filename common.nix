{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/virtualbox-image.nix>
    # Portable nice to haves
    ./packages.nix
    # xServer Config Required
    ./xserver.nix
  ];

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  networking = {
    networkmanager.enable = true;
  };

  # Extra Fonts
  fonts = {
    fonts = with pkgs; [
      corefonts
      inconsolata
      ubuntu_font_family
      unifont
    ];
  };

  # Set Time Zone
  time.timeZone = "America/New_York";

  # SSH Settings
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    forwardX11 = true;
    permitRootLogin = "no";
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint pkgs.hplip ];
    #clientConf = ''
    #  ServerName printhost.url.somewhere.com
    #'';
  };

  # Helps with rysnc, unison, etc over SSH
  programs.zsh.enable = true;

  # User Configuration
  users.mutableUsers = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
  users.extraUsers.eeyun = {
    group = "users";
    extraGroups = ["wheel"];
    uid = 1000;
    createHome = true;
    home = "/home/eeyun";
    useDefaultShell = true;
  };


  nixpkgs.config.packageOverrides = self: rec {
    oh-my-zsh = self.callPackage ./oh-my-zsh.nix {};
  };

  # Configure Zshell
  programs.zsh.interactiveShellInit = ''
    cat << EOF > ~/.zshrc
        . ${import ./zsh-config.nix}
    EOF
  '';
}
