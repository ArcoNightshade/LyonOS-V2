{ pkgs, settings, ... }: {
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [
    # Terminal(s)
    foot

    # Music/Creative
    tidal-hifi obsidian

    # Game dev
    godot ldtk
    # Internet tools
    firefox vesktop dino

    # Niri (And related)
    fuzzel waybar xwayland-satellite
  ];
}
