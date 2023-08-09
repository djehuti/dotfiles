# -*-mode:shell-script-*-
# ~/Dropbox/dotfiles/zshrc

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

set -o emacs

alias a=alias
alias h=history
alias j=jobs

PAGER=less
LESS="-XRFM"

export PAGER LESS

cdpath=( "${HOME}" "${HOME}/src" )
cdpath+=( "${HOME}/src/github.com" "${HOME}/src/github.com/djehuti" )

PS1='%F{green}%!%f %B%F{blue}%1~%#%f%b '

if [ -d ${HOME}/.zinit.d/ ]; then
    for f in ${HOME}/.zinit.d/[0-9]* ; do
        source "$f"
    done
    unset f
fi
