{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    enableTCP = false;

    # Keyboard Configuration
    layout = "us";
    xkbVariant = "mac";
    xkbOptions = "terminate:ctrl_alt_bksp, ctrl:nocaps";
    videoDrivers = [ "intel" "nouveau" ];
    vaapiDrivers = [ pkgs.vaapiIntel ];

    # Display Configuration
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    displayManager.slim.enable = true;
    displayManager.slim.autoLogin = false;
    displayManager.slim.defaultUser = "eeyun";
    displayManager.desktopManagerHandlesLidAndPower = false;
    windowManager.default = "awesome";
    windowManager.awesome.enable = true;

    # Trackpad Options
    multitouch.enable = true;
    multitouch.invertScroll = true;
    synaptics = {
      additionalOptions = ''
        Option "VertScrollDelta" "-100"
        Option "HorizScrollDelta" "-100"
      '';
      enable = true;
      tapButtons = true;
      fingersMap = [ 0 0 0 ];
      buttonsMap = [ 1 3 2 ];
      twoFingerScroll = true;
  };
}
