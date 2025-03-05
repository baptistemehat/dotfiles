# ----- BASE WINDOW ENVIRONMENT TOOLS -----
# The following recipes install all the tools needed to create the foundation of 
# my development environment:
# - a window manager (i3wm)
# - tools to customize the window manager
# - audio tools to provide default audio capabilities 

import "install-tools.just"

# main recipe of this justfile
[private]
base-tools: update xorg i3 nautilus nerdfont nmtui alsa pulseaudio arandr


# install alsa: provides audio drivers
[private]
alsa:
	sudo apt install -y alsa-tools

# install arandr: ui for xrandr
[private]
arandr: xorg
	sudo apt install -y arandr

# install i3 environment: i3 window manager, polybar status bar, feh wallpaper manager, picom compositor, i3lock lock screen
[private]
i3: cmake xorg (configure "i3" "picom" "polybar") mktmpdir && rmtmpdir
	#!/usr/bin/env bash
	set -euxo pipefail

	sudo apt install -y i3-wm polybar feh psmisc dmenu dunst

	# -- PICOM --
	git clone https://github.com/yshui/picom.git {{tmpdir}}/picom
	pushd {{tmpdir}}/picom

	sudo apt install -y libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev

	meson setup --buildtype=release build
	ninja -C build install

	popd

	# == I3LOCK-COLOR
	# dependencies for i3lock-color
	git clone https://github.com/Raymo111/i3lock-color.git {{tmpdir}}/i3lock-color
	pushd {{tmpdir}}/i3lock-color

	sudo apt install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev

	./build.sh
	./install-i3lock-color.sh

	popd

# install nautilus gui file explorer
[private]
nautilus:
	sudo apt install -y nautilus

# install nerdfont
[private]
nerdfont: unzip (configure "fontconfig")
	#!/usr/bin/env bash
	set -euxo pipefail

	# provides support for emojis
	sudo apt install  fonts-noto-color-emoji

# install network manager tui
[private]
nmtui:
	sudo apt install -y network-manager

# install pulseaudio: sound manager
[private]
pulseaudio:
	sudo apt install -y pulseaudio

# install xorg: x server
[private]
xorg: (configure "x11")
	sudo apt install -y xorg xinput
