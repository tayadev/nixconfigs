{ config, pkgs, ... }: {
  
  imports = [
    ./cli.nix
  ];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  services.xserver.xkb = {
    layout = "ch";
    variant = "de_nodeadkeys";
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

}
