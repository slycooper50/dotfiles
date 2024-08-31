##
## ~/.bashrc
##
#
## If not running interactively, don't do anything
#[[ $- != *i* ]] && return
#
#PS1='[\u@\h \W]\$ '

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH:/usr/lib64/openmpi/bin:/home/slycooper/matlab/bin"
#export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# ARCH Linux fix for tlmgr:
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
export TEXMFHOME="~/.texmf"



PS1="\[\e[31m\]\u \[\e[m\]\h \[\e[34m\]\w \[\e[m\] $ "
#for d in /usr/include/*; do p+=":$d"; done
#C_INCLUDE_PATH=$p
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
fi
alias code='cd $HOME/Desktop/Github/scientific'
alias github='cd $HOME/Desktop/Github'

# Set colors for GRUVBOX
source "/home/slycooper/.vim/plugged/gruvbox/gruvbox_256palette.sh"
export http_proxy="http://192.168.49.1:8000/"
export ftp_proxy="ftp://192.168.49.1:8000/"
export rsync_proxy="rsync://192.168.49.1:8000/"
export no_proxy="localhost,127.0.0.1,192.168.1.1,::1,*.local"
export HTTP_PROXY="http://192.168.49.1:8000/"
export FTP_PROXY="ftp://192.168.49.1:8000/"
export RSYNC_PROXY="rsync://192.168.49.1:8000/"
export NO_PROXY="localhost,127.0.0.1,192.168.1.1,::1,*.local"
export https_proxy="http://192.168.49.1:8000/"
export HTTPS_PROXY="http://192.168.49.1:8000/"

# tlmgr
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# colored man pages
export MANPAGER="less -R --use-color -Dd+y -Du+b -DN+r"
export MANROFFOPT="-P -c"
