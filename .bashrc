alias reload="source ~/.bashrc"
alias d="cd; cd Desktop/"
alias commit="git add .; git commit -m"
alias kb="git branch -d "
alias g="git"
alias gs="git status"
alias co="git checkout"
alias v="nvim"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

d_name() {
  echo -e "${PWD##*/}"
}

export TERM='xterm-256color'
export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1=' \[\e[96m\]== \[\e[32m\]$(d_name)\[\e[96m\]$(parse_git_branch) \[\e[96m\]>> \[\e[m\]'
