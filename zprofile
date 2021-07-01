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

unset LS_COLORS

if [ -f ${HOME}/.ansible_hosts ]; then
    export ANSIBLE_INVENTORY=${HOME}/.ansible_hosts
fi
