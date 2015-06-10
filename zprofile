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

BINTYPE=$(echo ${OSTYPE}-${HOSTTYPE} | sed -e 's/gnu-i.86/gnu-x86/')
USERNAME=""
PAGER=less
LESS="-XRFM"

pathmunge $HOME/bin
pathmunge $HOME/bin/$BINTYPE
pathmunge /sbin after
pathmunge /usr/sbin/after
pathmunge /Developer/Tools after
pathmunge /usr/local/bin after
pathmunge /opt/local/bin after
pathmunge /usr/X11R6/bin after

export USERNAME PATH PS1
export PAGER LESS HOSTNAME

unset LS_COLORS

if [ $MANPATH ]; then
    MANPATH=$MANPATH:/usr/local/man:/opt/local/share/man
else
    MANPATH=/usr/share/man:/usr/bin/man:/usr/local/man:/usr/local/share/man
fi
export MANPATH
