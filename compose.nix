
{ lib, settings,  ... }: {
  networking.hostName = "RTS"; # Change the hostname if you want
  system.stateVersion = "25.05"; # Don't change this
  time.timeZone = settings.timeZone;

  environment.sessionVariables.NIX_AUTO_RUN = "1";
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  /* Nix settings */
  nix.settings.sandbox = true;
  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.settings.download-buffer-size = 3221225472; # 256MB buffer to avoid "buffer full" warnings
  nix.settings.warn-dirty = false;
  nix.settings.trusted-users = [ "@wheel" ];
  nix.settings.allowed-users = [ "${settings.account.name}" ];

  /* Settings for optimisation of /nix/store */
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "weekly" ];

  /* Setting up home-manager */
  home-manager.users.${settings.account.name} = {
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
  };

  /* Setting up the user (Change your password, mine wont work for you!) */
  users.users.${settings.account.name} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$6$DaUWNF5nAbYNHkEF$sWF6rjw2Pw3E8gKfeqA/HvqUIoGoR431cqUsU0cMEo.I4YcbjtOzSW3Dj2Lk6NhDCcOiA9aJJW9LtvqKtmeDy1"; # Give it a guess, if you want.
  };

  /* Enabling graphical stuff for steam */
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/{settings.account.name}/.lyonos"; # sets NH_OS_FLAKE variable for you
  };

  /* Compressed memory */
  services.zram-generator.enable = true;
  services.zram-generator.settings.zram0.zram-size = "ram * 2"; # Might wanna change this to "ram" if you are having issues

  /* Power services */
  services = {
    power-profiles-daemon.enable = true;
    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 10;
      percentageAction = 5;
      criticalPowerAction = "Hibernate";
    };
  };

  powerManagement.cpuFreqGovernor = "powersave"; # Change this depending on your needs
  services.thermald.enable = true;
  services.tlp.enable = false;

  /* Network */
  networking.firewall.enable = true;
  networking.wireless.enable = lib.mkForce false;
  networking.networkmanager.enable = true;
  # services.openssh.enable = true;
  # services.printing.enable = true;

  /* UEFI */
  boot.loader.systemd-boot.enable = false;
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    style = {
      wallpapers = [
        ./modules/desktop/wallpapers/redbull-max.png # Go ahead and change this to a different picture
      ];
    interface.resolution = "1920x1080";
    interface.branding = "Welcome to LyonOS!";
    };
  };
  boot.loader.efi.efiSysMountPoint = "/boot";
  # boot.loader.grub.efiSupport = true;

  /* Uncomment your drive type */
  boot.loader.grub.device =
  # "/dev/vda";     /* Virtual drive     */
  # "/dev/sda";     /* Physical drive    */
  "/dev/nvme0n1"; /* Solid state drive */
}
