{ pkgs, ... }: {

  hardware.graphics.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    fira-code
    nerd-fonts.fira-code
  ];

  security.polkit.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    firefox
    chromium
  ];

  services.displayManager.ly.enable = true;

}
