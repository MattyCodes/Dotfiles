alias reload="source ~/.bashrc"
alias d="cd; cd Desktop/"
alias commit="git add .; git commit -m"
alias kb="git branch -d "
alias g="git"
alias gs="git status"
alias co="git checkout"
alias v="nvim"
alias b="bundle exec"
alias external-monitor="xrandr --output eDP-1 --off; xrandr --output HDMI-1 --auto"
alias internal-monitor="xrandr --output eDP-1 --auto; xrandr --output HDMI-1 --off"
alias suspend="sudo pm-suspend"

reload_kitty_colors() {
  kitty @ set-colors ~/.config/kitty/kitty.conf
}

apply_kitty_settings() {
  echo "allow_remote_control yes" >> ~/.config/kitty/kitty.conf
}

light_theme() {
  cat ~/.config/kitty/gruvbox-light.conf > ~/.config/kitty/kitty.conf
  sed -i '$d' ~/.config/nvim/init.vim
  echo "set background=light" >> ~/.config/nvim/init.vim

  apply_kitty_settings
  reload_kitty_colors
}

dark_theme() {
  cat ~/.config/kitty/gruvbox-dark.conf > ~/.config/kitty/kitty.conf
  sed -i '$d' ~/.config/nvim/init.vim
  echo "set background=dark" >> ~/.config/nvim/init.vim

  apply_kitty_settings
  reload_kitty_colors
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

d_name() {
  echo -e "${PWD##*/}"
}

export TERM='xterm-256color'
export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1=' \[\e[96m\]== \[\e[32m\]$(d_name)\[\e[96m\]$(parse_git_branch) \[\e[96m\]>> \[\e[m\]'
export EDITOR="/usr/bin/nvim"
