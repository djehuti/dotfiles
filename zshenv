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

case $(uname -s) in
    Darwin) QARG="-q" ;;
    FreeBSD) QARG="-q" ;;
    Linux) QARG="-q" ;;
    *) QARG="-s"
esac

pathmunge () {
    doit="no"
    if [ "$1" = "-f" ]; then
        doit="yes"
        shift
    elif [ -d "$1" ]; then
        doit="yes"
    fi
    if [ $doit = "yes" ]; then
        if ! echo $PATH | grep -E $QARG "(^|:)$1($|:)" ; then
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
        fi
    fi
}

EDITOR='emacsclient -a= -c'
BINTYPE=$(echo ${OSTYPE}-${MACHTYPE} | sed -e 's/gnu-i.86/gnu-x86/')
USERNAME=""
PAGER=less
LESS="-XRFM"
CCACHE_PREFIX=icecc

export USERNAME PATH EDITOR
export PAGER LESS HOSTNAME CCACHE_PREFIX

pathmunge $HOME/bin
pathmunge $HOME/bin/$BINTYPE
pathmunge /sbin after
pathmunge /usr/sbin/after
pathmunge /Developer/Tools after
pathmunge /usr/local/sbin after
pathmunge /usr/local/bin after
pathmunge /opt/local/bin after
pathmunge /usr/X11R6/bin after

HOMEBREW_DIR="/opt/homebrew"
if [ -d "${HOMEBREW_DIR}" ]; then
    eval "$(${HOMEBREW_DIR}/bin/brew shellenv)"
fi

unset LS_COLORS

if [ $MANPATH ]; then
    MANPATH=$MANPATH:/usr/local/man:/opt/local/share/man
else
    MANPATH=/usr/share/man:/usr/bin/man:/usr/local/man:/usr/local/share/man
fi
export MANPATH

[[ -f ${HOME}/.ansible_hosts ]] && {
    export ANSIBLE_INVENTORY=${HOME}/.ansible_hosts
}

[[ -f "${HOME}/.cargo/env" ]] && {
. "$HOME/.cargo/env"
}

[[ -v XDG_RUNTIME_DIR ]] && [[ -S ${XDG_RUNTIME_DIR}/gcr/ssh ]] && {
    export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/gcr/ssh
}
