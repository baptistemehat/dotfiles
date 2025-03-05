# ----- OTHER TOOLS -----
# The following recipes install additional tools not direcly linked with software development
# but that can be useful such as a web browser, a pdf viewer, an image manipulatin program, etc.

import "install-tools.just"

# install non-dev tools (web browser, podf viewer, etc.)
[private]
other-tools: update element evince firefox gimp keepassxc spotify thunderbird notion

# install element desktop: matrix client
[private]
element:
	#!/usr/bin/env bash
	sudo apt install -y wget apt-transport-https
	sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
	sudo apt update
	sudo apt install -y element-desktop

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

# install notion desktop
[private]
notion: snap
	sudo snap install notion-desktop

# install spotify: music service
[private]
spotify: curl
	curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt -y update && sudo apt install spotify-client

[private]
thunderbird: flatpak
	flatpak install flathub org.mozilla.Thunderbird
