# `~/.bashrc`

alias reload="source ~/.bashrc"
alias commit="git add .; git commit -m"
alias g="git"
alias gs="git status"
alias co="git checkout"
alias v="nvim"
alias b="bundle exec"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

d_name() {
  echo -e "${PWD##*/}"
}

export PS1=' \[\e[96m\]\[\e[32m\]$(d_name)\[\e[96m\]$(parse_git_branch)\[\e[0m\]: \[\e[m\]'
export TERM='xterm-256color'
export BASH_SILENCE_DEPRECATION_WARNING=1
