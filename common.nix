{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./xserver.nix
    ./boot-and-fs.nix
  ];

  # Allow unfree
  nixpkgs.config.allowUnfree = true;
  
  # Set network Options
  networking = {
    hostname = "munin";
    networkmanager.enable = true;
  };

  # Extra Fonts
  fonts = {
    fonts = with pkgs; [
      terminus_font
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

  # Set Environment Variables
  environment.variables = {
    PYTHONPATH = "="${pkgs.python27Packages.websocket_client}/lib/python2.7/site-packages/PIL/:${pkgs.python27Packages.websocket_client}/lib/python2.7/site-packages/:${pkgs.python27Packages.six}/lib/site-packages/PIL:${pkgs.python27Packages.six}/lib/python2.7/site-packages/";
  };

  nixpkgs.config.packageOverrides = pkgs: rec {
    oh-my-zsh = self.callPackage ./oh-my-zsh.nix {};
    zshrc = pkgs.callPackage ./zsh-config.nix {};
    gcalcli = pkgs.callPackage ./gcalcli.nix {};
    rainbowstream = pkgs.callPackage ./rainbowstream.nix {};
    requests235 = pkgs.stdenv.lib.overrideDerivation pkgs.python27Packages.requests2
  };

  # Configure Zshell
  programs.zsh.interactiveShellInit = ''
    source ${pkgs.zshrc}
  '';
}
