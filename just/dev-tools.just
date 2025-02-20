# ----- DEVELOPMENT TOOLS -----
# The following recipes install all the tools needed to build my development environmen:
# - alternative shell
# - terminal emulator
# - terminal multiplexer
# - code editor

import "install-tools.just"
import "base-tools.just"

# main recipe of this justfile
[private]
dev-tools: update alacritty fzf glab zsh nvim tmux

# install alacritty: terminal emulator
[private]
alacritty: rustup (configure "alacritty") mktmpdir && rmtmpdir
    #!/usr/bin/env bash
    set -euxo pipefail

    git clone https://github.com/alacritty/alacritty.git {{tmpdir}}/alacritty
    pushd {{tmpdir}}/alacritty 

    sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    
    . "$HOME/.cargo/env"
    rustup override set stable
    rustup update stable
    cargo build --release
    tic -xe alacritty,alacritty-direct extra/alacritty.info
    sudo cp target/release/alacritty /usr/local/bin

    popd

# install fzf: fuzzy finder
[private]
fzf:
	sudo apt install -y fzf

# install glab: gitlab cli
# [private]
# glab: go
# 	go install gitlab.com/gitlab-org/cli/cmd/glab@main


# list of dependencies for the treesitter nvim plugin
[private]
nvim-treesitter-dependencies: nvm python-venv

# install nvim: vim-based code editor
[private]
nvim: git ripgrep nvim-treesitter-dependencies (configure "nvim") mktmpdir && rmtmpdir
    #!/usr/bin/env bash
    set -euxo pipefail

    git clone https://github.com/neovim/neovim {{tmpdir}}/neovim
    pushd {{tmpdir}}/neovim

    sudo apt install -y ninja-build gettext cmake unzip curl build-essential
    # git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

    popd

# install ripgrep: recursive grep
[private]
ripgrep:
    sudo apt install -y ripgrep


# install upower: battery status
[private]
upower:
    sudo apt install -y upower

# install tmux: terminal multiplexer
[private]
tmux: git upower (configure "tmux")
    sudo apt install tmux -y
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

    # create a new tmux session to reload config
    ~/.config/tmux/plugins/tpm/bin/install_plugins   

# install zsh and oh-my-zsh: alternative shell
[private]
zsh: git (configure "zsh")
    sudo apt install zsh -y

    sudo chsh -s $(which zsh)

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --unattended
    
    mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
    cp baptiste.zsh-theme ${HOME}/.oh-my-zsh/custom/baptiste.zsh-theme

