# General

# Language
export LANG=en_US.UTF-8

# Text editor
export EDITOR=nvim
# Disable vi mode in shell
bindkey -e

# Setup XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="$XDG_CACHE_HOME/ansible/galaxy_cache"

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

export PYENV_ROOT=$XDG_DATA_HOME/pyenv

export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy

export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"

export WGETRC="$XDG_CONFIG_HOME/wgetrc"
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"

export HISTFILE="$XDG_STATE_HOME/zsh/history"

# Set history length
export HISTSIZE=SAVEHIST=100000
# General history settings
setopt pushdtohome
setopt sharehistory
setopt extendedhistory
# Disable history for space prefixed commands
setopt histignorespace

# Enable colors for man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# Make fzf follow 16 ANSI terminal colors
export FZF_DEFAULT_OPTS='--color=16'
# Use fd for fzf
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# Make bat follow 16 ANSI terminal colors
export BAT_THEME='ansi'

# Disable less history
export LESSHISTFILE=/dev/null
# Exclude underscore commands from correction suggestions
CORRECT_IGNORE="[_|.]*"

# Aliases

# Aliases are here and not in the .zshrc, because only .zshenv
# is sourced by the shell invoked through vim's '!' external command.

# Prompt for confirmation when overwriting files
alias cp='cp -i'
alias mv='mv -i'
# Enable colors for grep
alias grep='grep --color=auto'
# Pygmentize coloring
alias pyg='pygmentize -f terminal'
# Dir history alias
alias dh='dirs -v'
# Make sure python is python3
alias python='python3'
alias pip='pip3'
# Use nvim
alias vim='nvim'
alias vimdiff='nvim -d'
alias view='nvim -R'

case ${OSTYPE} in
darwin*)
	# Add user local binaries to PATH
	export PATH="${PATH}:${HOME}/.local/bin"
	# Disable MacOS shell state restoration which is annoying with tmux
	export SHELL_SESSIONS_DISABLE=1

	# Aliases for ls
	alias l='ls -h'
	alias la='ls -ah'
	alias ll='ls -hl'
	alias lla='ls -ahl'
	# Colors for BSD programs
	export CLICOLOR=1
	;;
linux-gnu)
	# Add user's Python modules to PATH
	export PATH="$PATH:/home/$USER/.local/bin"
	# Add pyenv to PATH
	export PATH="$PATH:/home/$USER/.pyenv/bin"

	# Aliases for ls
	alias ls='ls --color=auto'
	alias l='ls -h --color=auto'
	alias la='ls -ah --color=auto'
	alias ll='ls -hl --color=auto'
	alias lla='ls -ahl --color=auto'

	# Commands for xorg programms
	# Start mupdf in inverted colors mode
	mupdf="mupdf -I"
	;;
esac
