# Dotfiles

## Overview
This repo contains the install procedure and the configuration of my development environment.

The installation process is fully automated such that installing the full development environment is as simple as cloning this repo and runnig a single command.


## Install

> [!IMPORTANT]  
> This installation procedure is still a work in progress

1) Get debian testing (trixie) iso 
1) Clone this repo
```
sudo apt install git
git clone ...
```

1) Install just:
```
sudo apt install just
```

1) just
```
just --list   # list all recipes
```

* `base-env`: 
* `dev-env`: 
* `full-env`: 

## Additional configuration

### Bluetooth
Configuration of my bluetooth keyboard (Logitech MX keys mini)
```
bluetoothctl
power off
power on
agent KeyboardOnly
default-agent
pairable on
scan on
pair <mac address>
## the passkey will be printed, enter it on your keyboard ##
trust <mac address>
connect <mac address>
quit
```

## Details

The installation process relies on two tools
- the command runner [`just`](https://github.com/casey/just), to install the needed programs
- the symlink farm manager [GNU stow](https://www.gnu.org/software/stow/), to manage configuration files

Justfile calls sub-justfiles
Stow packages are under directory stow
