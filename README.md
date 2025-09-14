## LyonOS V2
#### New and *improved!*

---
### Setup
```
git clone https://github.com/ArcoNightshade/LyonOS-V2 ~/.flake && rm -rf ~/.flake/.git

cp /etc/nixos/hardware-configuration.nix ~/.flake/profile/home/hardware.nix
cp /etc/nixos/hardware-configuration.nix ~/.flake/profile/workstation/hardware.nix
```
Set your username.
```
nano ~/.flake/flake.nix
```
Specify your drive type (scroll to the bottom)
```
nano ~/.flake/compose.nix
```
Set your password, use this to get the hash
```
mkpasswd -m sha-512 <password>
```
Place the output in `hashedPassword = "";`
```
nano ~/.flake/compose.nix
```
Rebuild & reboot to be safe, or just switch.
```
sudo nixos-rebuild boot --flake ~/.flake#home
```
---

### Commands
```
sudo nixos-rebuild switch --flake ~/.flake#workstation
```
nixos-rebuild has a few options:
* switch  : switches to the new configuration immediately
* boot    : builds the next generation but does not switch until reboot
* dry-run : only evaluates the code to see if it works
* test    : switches to the new generation but does not save it to the boot menu

```
sudo nixos-rebuild switch --flake ~/.flake#home --rollback
```
Rolls back to the previous generation.

```
sudo nix-collect-garbage
```
Deletes all previous generations so you don't run out of space.

```
sudo nix flake update --flake ~/.flake#home
```
Update system.

```
nix-shell -p cowsay
```
Installs software to the shell (not the system) and is discarded when the shell (terminal) is closed.

#### Important links:

[How to setup NVIDIA](https://nixos.wiki/wiki/Nvidia) <br>
Copy paste to compose.nix and add `config` to `{ settings, ... }:` => `{ settings, config, ... }:`
```
  hardware.nvidia.open = false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  boot.blacklistedKernelModules = [ "nouveau" ];
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelParams = [
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia-drm.fbdev=1"
    "nvidia"
  ];
```


[NixOS packages](https://search.nixos.org/packages)

[NixOS options](https://search.nixos.org/options)

[Home manager options](https://home-manager-options.extranix.com/)
