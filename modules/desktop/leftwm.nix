{ settings, ... }:
{
# Enabling LeftWM
  services.xserver.windowManager.leftwm.enable = true;
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  boot.plymouth.enable = true;

  home-manager.users.${settings.account.name} = {
    # Getting the wallpapers
    home.file."Pictures/Wallpapers".source = ./wallpapers;
  };
}
