# ----- OTHER TOOLS -----
# The following recipes install additional tools not direcly linked with software development
# but that can be useful such as a web browser, a pdf viewer, an image manipulatin program, etc.

import "install-tools.just"

# install non-dev tools (web browser, podf viewer, etc.)
[private]
other-tools: update evince firefox gimp keepassxc spotify thunderbird xplr 

# install evince: pdf viewer
[private]
evince:
	sudo apt install evince

# install firefox: web browser
[private]
firefox: xorg i3
	sudo apt install -y firefox-esr

# install gimp: image manipulator program
[private]
gimp:
	sudo apt install -y gimp

# install keepassxc
[private]
keepassxc:
	sudo apt install -y keepassxc

# install spotify: music service
[private]
spotify: curl
	curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt -y update && sudo apt install spotify-client

[private]
thunderbird:
	flatpak install flathub org.mozilla.Thunderbird

# insatll xplr: terminal file explorer
[private]
xplr: rustup
	#!/usr/bin/env bash
	set -euxo pipefail

	. "$HOME/.cargo/env"
	cargo install --locked --force xplr

