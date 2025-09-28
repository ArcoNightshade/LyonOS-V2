{ pkgs, ... }: {
  imports = [
    ../../modules/desktop/kde.nix # Installing KDE DE
    ../../modules/apps/pc-apps.nix # Installing all of the graphical software (PC variant)
    ../../modules/experimental/cutting-edge.nix # Cutting edge stuff here (Nushell, uutils, and zoxide)
    ../../modules/apps/nushell.nix # Configuring nushell
    ../../modules/apps/zed.nix # Installing and configuring zed editor
    ../../modules/apps/fastfetch.nix # Defining the fastfetch configuration
    ../../modules/commands/software.nix # Installing all of the non-graphical software
    ../../modules/Development/nix.nix # Nixd and nil  ];
  ];

  nixpkgs.config.allowUnfree = true;

  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest; # Magic xanmod (Found better performance with it)
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx.enable = true; # Better scheduler

  fonts.packages = [ pkgs.nerd-fonts.fira-code pkgs.nerd-fonts.symbols-only ]; # Installing some nerd fonts and symbols

  hardware.cpu.intel.updateMicrocode = true; # Enabling intel microcode
  hardware.cpu.amd.updateMicrocode = true; # Enabling AMD microcode

  /* Below is a ton of kernel parameters and module stuff, modify at your own risk (Litle to none lol). */
  boot.kernelParams = [
    "splash"
    "quiet"
    "rd.systemd.show_status=false"
    "udev.log_level=0"
    "rd.udev.log_level=0"
    "udev.log_priority=0"
    "fastboot"
    "mitigations=off"
    "noibrs"
    "noibpb"
    "nopti"
    "nospectre_v1"
    "nospectre_v2"
    "l1tf=off"
    "nospec_store_bypass_disable"
    "no_stf_barrier"
    "mds=off"
    "tsx=on"
    "tsx_async_abort=off"
    "nowatchdog"
    "panic=1"
    "boot.panic_on_fail"
    "transparent_hugepage=always"
    "init_on_alloc=0"
    "init_on_free=0"
    "idle=nomwait"
    "ascpi_osi=Linux"
    "preempt=full"
    "uinput"
  ];
}
