{ settings, ... }:
{
home-manager.users.${settings.account.name} = {
  xdg.configFile."waybar".source = ../../waybar;
    };
}
