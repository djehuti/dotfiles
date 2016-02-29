#!/bin/bash

CHECK=""
[[ "x$1" == "x-C" ]] && {
    CHECK="-C"
}

# The name of the ansible-playbook command.
ANS=ansible-playbook
# The name of the prezto repo checkout directory.
PREZTO=prezto
PREZTO_REPO="git@github.com:djehuti/prezto.git"

DOTFILES_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "Dotfile directory is at '${DOTFILES_DIRECTORY}'."

hash zsh 2>/dev/null || {
    echo "You don't seem to have zsh installed; don't forget to do that."
}

PREZTO_RELATIVE="$(cd ${DOTFILES_DIRECTORY} && find .. -name ${PREZTO} -type d -print | head -1)"
[[ -z "$PREZTO_RELATIVE" ]] && {
    echo "I can't find prezto."
    PLACE="$( cd ${DOTFILES_DIRECTORY}/.. && pwd )"
    echo "You should probably 'git clone ${PREZTO_REPO}' somewhere nearby, like under '${PLACE}'."
    # CONSIDER: Offer to do that?
    exit 1
}
PREZTO_DIRECTORY="$( cd "${PREZTO_RELATIVE}" && pwd )"
# echo "Prezto is at '$PREZTO_DIRECTORY'."

hash $ANS 2>/dev/null || {
    echo "This script requires that $ANS be installed and on path."
    echo "You should probably 'sudo pip install ansible'."
    # CONSIDER: Offer to do that?
    exit 1
}

$ANS -c local "${DOTFILES_DIRECTORY}/setup.yml" ${CHECK} \
    --extra-vars="dotfiles=${DOTFILES_DIRECTORY} prezto=${PREZTO_DIRECTORY}"
