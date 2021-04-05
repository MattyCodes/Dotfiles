alias reload="source ~/.bashrc"
alias d="cd; cd Desktop/"
alias commit="git add .; git commit -m"
alias kb="git branch -d "
alias g="git"
alias gs="git status"
alias co="git checkout"
alias v="nvim"
alias b="bundle exec"
alias ngrok="~/Scripts/ngrok"
alias pi="cd ~/Projects/PlatformInfra"
alias app="cd ~/Projects/GroundfloorRails"
alias api="cd ~/Projects/GroundfloorAPI"
alias api-run="api; b foreman start -f Procfile.development"
alias api-web="PORT=5000 bundle exec puma -C config/puma.rb"
alias api-worker="env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=7 QUEUE=* bundle exec rake resque:work"
alias api-scheduler="bundle exec rake resque:scheduler"
alias api-subscriber="bundle exec rake redis_notification_subscriber:subscribe"
alias clear-stale-branches="PERMANENT_BRANCHES=\"develop, master\" ruby ~/Scripts/clear_stale_branches.rb"
alias migrate-databases="APP_ENV=test b rake db:migrate; APP_ENV=development b rake db:migrate"
alias reset-databases="ruby ~/Scripts/reset_groundfloor_databases.rb"
alias external-monitor="xrandr --output eDP-1 --off; xrandr --output HDMI-1 --auto"
alias internal-monitor="xrandr --output eDP-1 --auto; xrandr --output HDMI-1 --off"
alias suspend="sudo pm-suspend"
alias prod-console="heroku run bundle exec bin/console --app gf-api-production"
alias restart-pulseaudio="pulseaudio -k; pulseaudio -D"

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
export PATH="$HOME/.rbenv/bin:$PATH"
export EDITOR="/usr/bin/nvim"

eval "$(rbenv init -)"
eval "$(xset s off)"
eval "$(xset -dpms)"
source "$HOME/.cargo/env"
