{ pkgs, settings, ... }: {
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [
    # Terminal(s)
    foot

    # Development
    vscodium-fhs

    # Internet tools
    firefox google-chrome
  ];
}
