# Make sure to add this to your bookmarks: https://search.nixos.org/options
# This is where common options are set so you don't have to repeat yourself across files
{ lib, settings,  ... }: {
  networking.hostName = "nixos";
  system.stateVersion = "25.05";
  time.timeZone = settings.timeZone;

  environment.sessionVariables.NIX_AUTO_RUN = "1";
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  nix.settings.sandbox = true;
  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.settings.download-buffer-size = 3221225472; # 256MB buffer to avoid "buffer full" warnings
  nix.settings.warn-dirty = false;
  nix.settings.trusted-users = [ "@wheel" ];
  nix.settings.allowed-users = [ "${settings.account.name}" ];

  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "weekly" ];
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 30d";

  home-manager.users.${settings.account.name} = {
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
  };

  users.users.${settings.account.name} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$6$DaUWNF5nAbYNHkEF$sWF6rjw2Pw3E8gKfeqA/HvqUIoGoR431cqUsU0cMEo.I4YcbjtOzSW3Dj2Lk6NhDCcOiA9aJJW9LtvqKtmeDy1";
  };

  hardware.graphics.enable = true;

  /* Compressed memory */
  services.zram-generator.enable = true;
  services.zram-generator.settings.zram0.zram-size = "ram * 2";

  /* Network */
  networking.firewall.enable = true;
  networking.wireless.enable = lib.mkForce false;
  networking.networkmanager.enable = true;
  # services.openssh.enable = true;

  /* BIOS */
  # boot.loader.grub.enable = true;
  # boot.loader.grub.useOSProber = true;

  /* UEFI */
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.efiSupport = true;

  /* Uncomment your drive type */
  boot.loader.grub.device =
  # "/dev/vda";     /* Virtual drive     */
  # "/dev/sda";     /* Physical drive    */
  "/dev/nvme0n1"; /* Solid state drive */
}
