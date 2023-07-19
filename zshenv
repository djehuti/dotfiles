#---------------------------
# ZSH startup:
#
# 1g. /etc/zsh/zshenv
# 1u. ~/.zshenv                      <==========
# 2g. IF LOGIN: /etc/zsh/zprofile
# 2u. IF LOGIN: ~/.zprofile
# 3g. IF INTERACTIVE: /etc/zsh/zshrc
# 3u. IF INTERACTIVE: ~/.zshrc
# 4g. IF LOGIN: /etc/zsh/zlogin
# 4u. IF LOGIN: ~/.zlogin
#---------------------------

PATH="${HOME}/bin:${PATH}"

EDITOR=emacsclient
ALTERNATE_EDITOR=""
export EDITOR ALTERNATE_EDITOR

unset LS_COLORS

[[ -f ${HOME}/.ansible_hosts ]] && {
    export ANSIBLE_INVENTORY=${HOME}/.ansible_hosts
}

[[ -f "${HOME}/.cargo/env" ]] && {
. "$HOME/.cargo/env"
}

[[ -v XDG_RUNTIME_DIR ]] && [[ -S ${XDG_RUNTIME_DIR}/gcr/ssh ]] && {
    export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/gcr/ssh
}
