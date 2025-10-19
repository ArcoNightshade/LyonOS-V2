
![GitHub last commit](https://img.shields.io/github/last-commit/ArcoNightshade/LyonOS-V2?style=for-the-badge&labelColor=101418&color=9ccbfb)
![GitHub Repo stars](https://img.shields.io/github/stars/ArcoNightshade/LyonOS-V2?style=for-the-badge&labelColor=101418&color=b9c8da)
![GitHub repo size](https://img.shields.io/github/repo-size/ArcoNightshade/LyonOS-V2?style=for-the-badge&labelColor=101418&color=d3bfe6)

#### LyonOS V2 - New and *improved!*

LyonOS is my personal, opinionated Linux distribution based on NixOS. This repository contains all the configuration files to replicate my complete desktop environment (ricing) on any machine.

If you appreciate the philosophy of a declarative and reproducible operating system and enjoy a minimalist and highly customized desktop, LyonOS might be a good starting point for you.

---
### Setup
```
git clone https://github.com/ArcoNightshade/LyonOS-V2 ~/.lyonos && rm -rf ~/.lyonos/.git
```

```
cp /etc/nixos/hardware-configuration.nix ~/.lyonos/profile/home/hardware.nix
```


Set your username.
```
nano ~/.lyonos/flake.nix
```


Specify your drive type (scroll to the bottom)
```
nano ~/.lyonos/compose.nix
```


Set your password, use this to get the hash
```
mkpasswd -m sha-512 <password>
```


Place the output in `hashedPassword = "";`
```
nano ~/.lyonos/compose.nix
``````

Rebuild & reboot to be safe, or just switch.
```
sudo nixos-rebuild boot --flake ~/.lyonos#workstation
```
---

### Commands
```
sudo nixos-rebuild switch --flake ~/.lyonos#workstation
```
nixos-rebuild has a few options:
* switch  : switches to the new configuration immediately
* boot    : builds the next generation but does not switch until reboot
* dry-run : only evaluates the code to see if it works
* test    : switches to the new generation but does not save it to the boot menu

```
sudo nixos-rebuild switch --flake ~/.lyonos#workstation --rollback
```
Rolls back to the previous generation.

```
sudo nix-collect-garbage
```
Deletes all previous generations so you don't run out of space.

```
sudo nix flake update --flake ~/.lyonos#workstation
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
