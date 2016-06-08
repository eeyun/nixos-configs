{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
  [
    # Shells
    zsh

    # Editors
    vim
    atom

    # Browsers
    opera

    # Development
    gitFull

    # Polyglot
    go
    ruby
    python
    python27Packages.websocket_client

    # Desktop
    awesome
    xlibs.xmessage
    weechat
    range
    mpd
    imagemagick

    # Admin
    file
    gparted
    htop
    pciutils
    tree
    wget
    curl
    openvpn
    nixops

    # Terminal Emulator
    rxvt

    # Nix
    nix-repl
    nix-prefetch-scripts
  ];

  nix = {
    binaryCaches = [
     "http://cache.nixos.org"
     "https://hydra.nixos.org"
    ];
    trustedBinaryCaches =[
      "https://nixcache.reflex-frp.org"
      "http://hydra.cryp.to"
    ];
  };
}
