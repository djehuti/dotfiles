#!/bin/bash

set -euo pipefail

# The name of the ansible-playbook command.
ANS=ansible-playbook

DOTFILES_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "Dotfile directory is at '${DOTFILES_DIRECTORY}'."

hash $ANS 2>/dev/null || {
    echo "This script requires that $ANS be installed and on path."
    echo "You should probably 'sudo pip install ansible'."
    # CONSIDER: Offer to do that?
    exit 1
}

$ANS -c local "${DOTFILES_DIRECTORY}/setup.yml" "$@" \
    --extra-vars="dotfiles=${DOTFILES_DIRECTORY}"
