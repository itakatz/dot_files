# my dot_files
## Tmux
- After cloning this repo (e.g to `~/git_repos`), set the tmux conf using `ln -s git_repos/dot_files/.config/tmux/.tmux.conf .`
- clone the plugin manager: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- Install the plugins using tmux's `prefix + I`
- Install cattpuccin colorscheme: `https://github.com/catppuccin/tmux?tab=readme-ov-file#installation`
## Nvim
- install:
  - `wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage`
  - `chmod u+x nvim.appimage`
  - `sudo mv nvim.appimage /usr/local/bin/`
  - `cd /usr/local/bin`
  - `sudo ./nvim.appimage --appimage-extract`
  - `sudo ln -s squashfs-root/AppRun nvim`
- install `npm` (for Mason to work):
  - ~`sudo apt install nodejs npm`~
  - (Better option):
    -  Install version manager `nvm`, see https://github.com/nvm-sh/nvm (and reload `.bashrc`)
    -  Install `npm` and `node` using `nvm install --lts`
- install gcc: `sudo apt update && sudo apt install build-essential`
- setup: `ln -s ~/git_repos/dot_files/.config/nvim ~/.config/nvim` 
