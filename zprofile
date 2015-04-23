# ~/Dropbox/dotfiles/zprofile

# User specific environment and startup programs

case $(uname -s) in
    Darwin) QARG="-q" ;;
    FreeBSD) QARG="-q" ;;
    Linux) QARG="-q" ;;
    *) QARG="-s"
esac

pathmunge () {
    if [ -d "$1" ]; then
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
pathmunge $HOME/bin/iworkeng after
pathmunge /sbin after
pathmunge /usr/sbin/after
pathmunge /Developer/Tools after
pathmunge /usr/X11R6/bin after

export USERNAME PATH PS1
export PAGER LESS HOSTNAME

unset LS_COLORS

# PRC-Tools for Mac OS X additions...
PATH=$PATH:/usr/local/bin
export PATH
if [ $MANPATH ]; then
    MANPATH=$MANPATH:/usr/local/man
else
    MANPATH=/usr/share/man:/usr/bin/man:/usr/local/man:/usr/local/share/man
fi
export MANPATH
# ...end of PRC-Tools for Mac OS X additions.
