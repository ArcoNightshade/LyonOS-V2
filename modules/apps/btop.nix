{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "horizon";
      theme_background = false;    };
  };
}
