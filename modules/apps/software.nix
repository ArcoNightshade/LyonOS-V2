{ inputs, pkgs, settings, ... }: let
    # Bring in the unstable channel
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [
    # Terminal
    foot alacritty

    # Music/Creative
    tidal-hifi obsidian

    # Web stuff
    firefox vesktop

    # Niri (And related)
    fuzzel waybar xwayland-satellite gammastep
  ];
  # Check https://search.nixos.org/packages to see which packages are available
}
