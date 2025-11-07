
{ pkgs, settings, ... }: {
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [

    # Music/Creative
    tidal-hifi obsidian

    # Internet tools
    firefox vesktop dino
  ];
}
