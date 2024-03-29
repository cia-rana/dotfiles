# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# git
GIT_PS1_SHOWDIRTYSTATE=1
source $HOME/dotfiles/git/contrib/completion/git-completion.bash
source $HOME/dotfiles/git/contrib/completion/git-prompt.sh
alias gitnetwork="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gitpushoriginhead="git push origin HEAD"

# terminal colorize
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$(__git_ps1)$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GOROOT=$HOME/go
export GOOS=linux
export GOARCH=amd64
export GOBIN=$GOROOT/bin
export GOPATH=$GOROOT/.go
export PATH=$GOBIN:$PATH

[[ -s ~/.gvm/scripts/gvm ]] && source ~/.gvm/scripts/gvm
export PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT/shims ]; then
	export PATH=$PYENV_ROOT/shims:$PATH
	[[ -x $PYENV_ROOT/shims/pyenv ]] && eval "$($PYENV_ROOT/shims/pyenv init -)"
elif [ -d $PYENV_ROOT/bin ]; then
	export PATH=$PYENV_ROOT/bin:$PATH
	[[ -x $PYENV_ROOT/bin/pyenv ]] && eval "$($PYENV_ROOT/bin/pyenv init -)"
fi

# pyenv for python
export PATH="$PYENV_ROOT/versions/anaconda3-4.1.0/bin:$PATH"

# rbenv for ruby
export RBENV_ROOT=$HOME/.rbenv
if [ -d $RBENV_ROOT ]; then
  export PATH=$RBENV_ROOT/bin:$PATH
  eval "$(rbenv init -)"
fi

export FLUTTER_ROOT="$HOME/flutter"
export PATH=$FLUTTER_ROOT/bin:$PATH

# tmux
case ${OSTYPE} in
  darwin*)
    alias tmux-clipboard="pbcopy"
    ;;
  linux*)
    alias tmux-clipboard="xsel -bi"
    ;;
esac
[[ -x tmux ]] && tmux source .tmux.conf
alias tmux="tmux -2 -u"

# to install softwere under $HOME
export PATH=$HOME/usr/bin:$PATH
export LD_LIBRARY_PATH=$HOME/usr/lib64:$HOME/usr/lib:$LD_LIBRARY_PATH

# set vi mode
set -o vi

if [ "$(uname)" == 'Darwin' ]; then
  alias vim="/usr/local/bin/vim"
fi

# pub for dart
export PATH=$PATH:$HOME/.pub-cache/bin

# nodebrew for node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

# oahu setting
export OAHU_INFRA_DIR=/Users/s06111/Projects/cyberagent/oahu-ops
export OAHU_DOC_DIR=/Users/s06111/Projects/cyberagent/oahu-doc
export OAHU_FRONTEND_DIR=/Users/s06111/Projects/cyberagent/oahu-front
export OAHU_BACKEND_DIR=/Users/s06111/Projects/cyberagent/oahu-api

export PATH=/usr/local/sbin:$PATH
export LC_ALL=ja_JP.UTF-8
