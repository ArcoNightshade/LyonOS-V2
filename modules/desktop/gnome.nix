{ ... }: {
  # Enable desktop environment
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;

  # Audio
  security.rtkit.enable = true;
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.jack.enable = true;

  # Boot screen, take out to see systemd logs
  boot.plymouth.enable = true;
}
