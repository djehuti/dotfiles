# -*-mode:shell-script-*-
#---------------------------
# ZSH startup:
#
# 1g. /etc/zsh/zshenv
# 1u. ~/.zshenv
# 2g. IF LOGIN: /etc/zsh/zprofile
# 2u. IF LOGIN: ~/.zprofile
# 3g. IF INTERACTIVE: /etc/zsh/zshrc
# 3u. IF INTERACTIVE: ~/.zshrc       <==========
# 4g. IF LOGIN: /etc/zsh/zlogin
# 4u. IF LOGIN: ~/.zlogin
#---------------------------

cdpath=( "${HOME}" "${HOME}/src" )
cdpath+=( "${HOME}/src/github.com" "${HOME}/src/github.com/djehuti" )

if [ "${TERM}" = "dumb" ]; then
    PS1='%! %1~%# '
else
    if [ -n "${CONTAINER_ID}" ]; then
        PS1='%F{green}%!%f %B%F{red}['"${CONTAINER_ID}"']%f%b %B%F{blue}%1~%#%f%b '
    else
        # green history number; bold blue path (last component) and % (or #)
        PS1='%F{green}%!%f %B%F{blue}%1~%#%f%b '
    fi
fi

if [ -d ${HOME}/.init.d/ ]; then
    for f in ${HOME}/.init.d/[0-9]* ; do
        source "$f"
    done
    unset f
fi

echo $(hostname):$(uptime)
