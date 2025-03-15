# Dotfiles
A few configuration files and setup steps that I'm likely to need in any new environment.

## Steps:
Assuming a Linux system:
- `sudo apt update`
- `sudo apt install kitty`
- `sudo apt install neovim`
- `git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim`
- `git clone https://github.com/kien/ctrlp.vim ~/.config/nvim/bundle/ctrlp.vim`
- ```
  cp .gitconfig ~/.gitconfig
  cp .bashrc ~/.bashrc
  mkdir -p ~/.config/nvim
  cp init.vim ~/.config/nvim/init.vim
  mkdir -p ~/.config/kitty
  cp kitty.conf ~/.config/kitty/kitty.conf
  ```
- Lastly, open a Neovim window and run the Vundle installer via `:PluginInstall`