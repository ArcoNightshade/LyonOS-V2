{ lib, ... }:
{
  environment.etc."os-release".text = lib.mkForce ''
    NAME="LyonOS"
    ID=lyon
    PRETTY_NAME="LyonOS 25.05/0.1"
    VERSION="25.05/0.1"
    VERSION_ID="25.05/0.1"
    VERSION_CODENAME=quasar
    BUILD_ID="25.05/0.1"
    BUG_REPORT_URL="https://github.com/ArcoNightshade/LyonOS-V2"
    VENDOR_NAME="LyonOS"
    VENDOR_URL="https://github.com/ArcoNightshade/LyonOS-V2"
    LOGO="nix-snowflake"
    HOME_URL="https://github.com/ArcoNightshade/LyonOS-V2"
    DOCUMENTATION_URL="https://github.com/ArcoNightshade/LyonOS-V2"
    SUPPORT_URL="https://github.com/ArcoNightshade/LyonOS-V2"
    ANSI_COLOR="0;38;2;126;186;228"
    DEFAULT_HOSTNAME=RTS
    CPE_NAME="cpe:/o:lyonos:lyonos:25.05/0.1"
  '';
}
