# ----- TMP DIR -----
# all downloaded packages, git repos and archives are downloaded|built in this tmp directory
tmpdir := "tmp"

# remove tmp directory
[private]
rmtmpdir:
	rm {{tmpdir}} -rf

# create a tmp directory
[private]
mktmpdir: rmtmpdir
	mkdir -p {{tmpdir}}

# ----- INSTALL TOOLS -----
# The following recipes install programs required for downloading, building and installing 
# the tools that make up my dev environment

# install cmake: c/c++ building tool
[private]
cmake:
	sudo apt install -y cmake

# install curl
[private]
curl:
	sudo apt install -y curl

[private]
flatpak: update
	sudo apt install -y flatpak
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install git
[private]
git: (configure "git")
	sudo apt install -y git

# install nvm: node version manager providing nodejs and npm
[private]
nvm:
    #!/usr/bin/env bash
    set -euxo pipefail

    unset NVM_DIR
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    source $HOME/.bashrc

    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    nvm install node

# install python-venv: python virtual environment
[private]
python-venv:
	sudo apt install -y python3-venv


# install rustup: rust toolchain installer
[private]
rustup: curl
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install stow: symlink manager
[private]
stow:
	sudo apt install -y stow

# retrieve configuration for stow `packages`
[private]
configure +packages: stow
	stow -Rv --dir stow/ --target ~ {{packages}}

# run apt update and upgrade on the system
[private]
update:
	sudo apt update -y
	sudo apt upgrade -y

# install unzip
[private]
unzip:
	sudo apt install -y unzip

