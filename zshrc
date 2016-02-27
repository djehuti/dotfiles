# -*-mode:shell-script-*-
# ~/Dropbox/dotfiles/zshrc

set -o appendhistory
set -o histexpiredupsfirst
set -o sharehistory
set -o incappendhistory
HISTFILE=${HOME}/.zsh_history
export HISTFILE
HISTSIZE=1000000
export HISTSIZE
SAVEHIST=100000
export SAVEHIST

alias a=alias
alias h=history
alias j=jobs

case $(uname -s) in
    FreeBSD) COLORARG=" -G" ;;
    Darwin) COLORARG=" -G" ;;
    Linux) COLORARG=" --color=tty" ;;
    *) COLORARG=""
esac

if [ "`uname`" = "Darwin" ]; then
    compctl -f -x 'p[2]' -s "`/bin/ls -d1 /Applications/*/*.app /Applications/*.app | sed 's|^.*/\([^/]*\)\.app.*|\\1|;s/ /\\\\ /g'`" -- open
    alias run='open -a'
fi

cdpath=( ${HOME} ${HOME}/src ${HOME}/Vagrants ${HOME}/Vagrants/UATC /vagrant /vagrant/src ${HOME}/Dropbox/src )

alias l="ls -p$COLORARG"
alias ls="ls -p$COLORARG"
alias la="ls -Ap$COLORARG"
alias ll="ls -lp$COLORARG"
alias lla="ls -lAhp$COLORARG"
alias siri="sudo"

PS1='%F{green}%!%f %B%F{blue}%1~%#%f%b '

if [ -d ${HOME}/.zinit.d/ ]; then
    for f in ${HOME}/.zinit.d/[0-9]* ; do
        source "$f"
    done
    unset f
fi
