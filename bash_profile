# ~/Dropbox/dotfiles/bash_profile

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
BASH_ENV=$HOME/.bashrc
USERNAME=""
PS1='\[\e[34;1m\]bash\$\[\e[0m\] '
#P4USER=bcox
#P4EDITOR=emacs
#P4CONFIG=P4ENV
PAGER=less
LESS="-XRFM"

if [ "x$BENS_PROFILE_HAS_RUN" == "x" ]; then
    pathmunge $HOME/bin
    pathmunge $HOME/bin/$BINTYPE
    pathmunge /sbin after
    pathmunge /usr/sbin/after
    pathmunge /Developer/Tools after
    pathmunge /usr/X11R6/bin after
    BENS_PROFILE_HAS_RUN=true
    export BENS_PROFILE_HAS_RUN
fi

# Set the DISPLAY environment variable if X is running.
# . ~/bin/setmacdisplay
# Forget it, too slow; just always set it.
#if [ "x$DISPLAY" == "x" ]; then
#    DISPLAY=:0.0
#    export DISPLAY
#fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export USERNAME BASH_ENV PATH PS1
# export P4USER P4EDITOR P4CONFIG
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

# Fink
if [ -d /sw/bin ]; then
    . /sw/bin/init.sh
fi
