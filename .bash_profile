# .bash_profile

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PYTHON_COLORS=0
export PYTHON_BASIC_REPL=1

export EDITOR=nvim
export VISUAL=nvim

export PATH="$PATH:$HOME/.local/bin"

test -d dotfiles && cd dotfiles && git pull

