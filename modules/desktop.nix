{ pkgs, ... }: {

  hardware.graphics.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    fira-code
    nerd-fonts.fira-code
  ];

  security.polkit.enable = true;

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    firefox
  ];

  services.displayManager.ly.enable = true;

}
