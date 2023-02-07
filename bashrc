#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\[$(tput bold)\]\[\033[38;5;33m\]\h\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]:\w> \[$(tput sgr0)\]"

# ARCH Linux fix for tlmgr:
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
export TEXMFHOME="~/.texmf"

# grep always color
alias grep='grep --color=always'
alias github='cd ~/Desktop/Github'
