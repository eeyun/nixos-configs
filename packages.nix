{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
  [
    # Shells
    zsh
    zshrc
    oh-my-zsh

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
    python27Packages.powerline
    python27Packages.websocket_client
    python27Packages.six

    # Desktop
    awesome
    slim
    gtk_engines
    lxappearance
    stdenv
    xfontsel
    xlibs.xmessage
    xlibs.xinput
    weechat
    ranger
    feh
    xpdf
    mpd
    mutt
    imagemagick

    # Admin
    file
    gparted
    htop
    pciutils
    tree
    wget
    curl
    lsof
    openvpn
    nixops

    # Terminal Emulator
    rxvt_unicode

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
