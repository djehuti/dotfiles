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
EDITOR=emacsclient
BINTYPE=$(echo ${OSTYPE}-${HOSTTYPE} | sed -e 's/gnu-i.86/gnu-x86/')
USERNAME=""
PAGER=less
LESS="-XRFM"
CCACHE_PREFIX=icecc

export USERNAME PATH PS1 EDITOR
export PAGER LESS HOSTNAME CCACHE_PREFIX

GOPATH=${HOME}/gocode
UBER_LDAP_UID=bcox
UBER_HOME=${HOME}/Uber
UBER_OWNER=bcox@uber.com
export GOPATH UBER_LDAP_UID UBER_HOME UBER_OWNER

pathmunge $HOME/bin
pathmunge $HOME/bin/$BINTYPE
pathmunge /sbin after
pathmunge /usr/sbin/after
pathmunge /Developer/Tools after
pathmunge /usr/local/sbin after
pathmunge /usr/local/bin after
pathmunge /opt/local/bin after
pathmunge /usr/X11R6/bin after

GOPATH=$HOME/gocode
export GOPATH

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
