# -*-mode:shell-script-*-

# This is invoked for interactive non-login shells.

CDPATH=".:${HOME}:${HOME}/src:${HOME}/src/github.com:${HOME}/src/github.com/djehuti:${HOME}/src/github.com/X16Community"

if [ "${TERM}" == "dumb" ]; then
    PS1='\! \W\$ '
else
    if [ -n "${CONTAINER_ID}" ]; then
        PS1='\[\e[32m\]\!\[\e[0m\] \[\e[31;1m\][${CONTAINER_ID}]\[\e[0m\] \[\e[34;1m\]\W\$\[\e[0m\] '
    else
        PS1='\[\e[32m\]\!\[\e[0m\] \[\e[34;1m\]\W\$\[\e[0m\] '
    fi
fi

if [ -d ${HOME}/.init.d/ ]; then
    for f in ${HOME}/.init.d/[0-9]* ; do
        source "$f"
    done
    unset f
fi
