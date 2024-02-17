# -*-mode:shell-script-*-

# This is invoked for interactive non-login shells.

if [ "${TERM}" == "dumb" ]; then
    export PS1='${HOSTNAME%%.*}\$ '
else
    export PS1='\[\e[34;1m\]\W\$\[\e[0m\] '
fi

export HISTSIZE=100000
shopt -s histappend

alias a=alias
alias h=history
alias j=jobs

alias l="ls -NF --color=tty"
alias ls="ls -NF --color=tty"
alias la="ls -AF --color=tty"
alias ll="ls -lNF --color=tty"
