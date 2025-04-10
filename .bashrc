PS1='[\u@\h \W]\$ '
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Test for python vs python3, then test for virtualenv
python_cmd=$(command -v python &>/dev/null && printf python || printf python3)
venv_cmd=$(command -v virtualenv &>/dev/null && printf virtualenv || printf "%s -m venv" $python_cmd)
alias va='source .venv/bin/activate'
alias vc="$venv_cmd .venv"

alias gr='git restore'
alias grs='git restore --staged'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'

alias ls='ls --color=never'
