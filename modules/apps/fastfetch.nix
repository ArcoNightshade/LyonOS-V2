{ settings, ... }:
{
home-manager.users.${settings.account.name} = {
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "modules": [
        "title",
        "separator",
        "os",
        "kernel",
        "uptime",
        "wm",
        "break",
        "colors",
      ],
    }
  '';
  };
}
