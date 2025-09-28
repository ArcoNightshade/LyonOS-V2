{ pkgs, settings, ... }: {
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
