# -*-mode:shell-script-*-
# ~/Dropbox/dotfiles/zprofile

# User specific environment and startup programs

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
        if ! echo $PATH | egrep $QARG "(^|:)$1($|:)" ; then
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
        fi
    fi
}

#EDITOR='emacsclient -a= -c -t'
#EDITOR=emacsclient
if [ -f /usr/bin/gedit ]; then
    EDITOR=gedit
else
    EDITOR=emacs
fi
BINTYPE=$(echo ${OSTYPE}-${MACHTYPE} | sed -e 's/gnu-i.86/gnu-x86/')
USERNAME=""
PAGER=less
LESS="-XRFM"
CCACHE_PREFIX=icecc

export USERNAME PATH PS1 EDITOR
export PAGER LESS HOSTNAME CCACHE_PREFIX

GOPATH=${HOME}/gocode
export GOPATH

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

if [ -f ${HOME}/.ansible_hosts ]; then
    export ANSIBLE_INVENTORY=${HOME}/.ansible_hosts
fi


# Added by Toolbox App
export PATH="$PATH:/Users/bcox/Library/Application Support/JetBrains/Toolbox/scripts"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bcox/Library/Mobile Documents/com~apple~CloudDocs/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bcox/Library/Mobile Documents/com~apple~CloudDocs/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bcox/Library/Mobile Documents/com~apple~CloudDocs/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bcox/Library/Mobile Documents/com~apple~CloudDocs/src/google-cloud-sdk/completion.zsh.inc'; fi
