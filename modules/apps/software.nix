{ inputs, pkgs, settings, ... }: let
    # Bring in the unstable channel
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [
    # Terminal(s)
    foot

    # Music/Creative
    tidal-hifi obsidian

    # Internet tools
    firefox vesktop

    # Niri (And related)
    fuzzel waybar xwayland-satellite
  ];
}
