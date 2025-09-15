{ pkgs, ... }: {
  imports = [
    ../../modules/desktop/niri.nix
    ../../modules/desktop/gnome.nix
    ../../modules/apps/software.nix
    ../../modules/apps/zed.nix
    ../../modules/apps/waybar.nix
    ../../modules/apps/fuzzel.nix
    ../../modules/apps/foot.nix
    ../../modules/apps/fastfetch.nix
    ../../modules/commands/software.nix
    ../../modules/commands/shell.nix
    ../../modules/Development/nix.nix
    ../../modules/Development/rs.nix
    ../../modules/Development/haskell.nix
  ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    mako
    swww
    niri
    waybar
    fuzzel
    foot
    xwayland-satellite
  ];
  environment.sessionVariables.NIX_AUTO_RUN = "1";
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx.enable = true;

  fonts.packages = [ pkgs.nerd-fonts.fira-code pkgs.nerd-fonts.symbols-only ];
  boot.kernelParams = [
    "splash"
    "quiet"
    "rd.systemd.show_status=false"
    "udev.log_level=0"
    "rd.udev.log_level=0"
    "udev.log_priority=0"
    "fastboot"
  ];
  boot.blacklistedKernelModules = [ ];
}
