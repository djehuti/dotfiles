# ~/Dropbox/dotfiles/bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#----------------------------------------------------------------------
# This defines a bash command named `edit' which contacts/resumes an
# existing emacs or starts a new one if none exists.
#
# One way or another, any arguments are passed to emacs to specify files
# (provided you have loaded `resume.el').
#
# This function assumes the emacs program is named `emacs' and is somewhere
# in your load path.  If either of these is not true, the most portable
# (and convenient) thing to do is to make an alias called emacs which
# refers to the real program, e.g.
#
#        alias emacs=/usr/local/bin/gemacs
#
# Written by Noah Friedman.

function edit ()
{
 local windowsys="${WINDOW_PARENT+sun}"

 windowsys="${windowsys:-${DISPLAY+x}}"

 if [ -n "${windowsys:+set}" ]; then
    # Do not just test if these files are sockets.  On some systems
    # ordinary files or fifos are used instead.  Just see if they exist.
    if [ -e "${HOME}/.emacs_server" -o -e "/tmp/esrv${UID}-"* ]; then
       emacsclient --no-wait "$@"
       return $?
    else
       echo "edit: starting emacs in background..." 1>&2
    fi

    case "${windowsys}" in
      x ) (emacs "$@" &) ;;
      sun ) (emacstool "$@" &) ;;
    esac
 else
    if jobs %emacs 2> /dev/null ; then
       echo "$(pwd)" "$@" >| ${HOME}/.emacs_args && fg %emacs
    else
       emacs "$@"
    fi
 fi
}
#----------------------------------------------------------------------


# User specific aliases and functions

if [ -n "$PS1" ]; then
    if [ "x$BENS_PROFILE_HAS_RUN" == "x" ]; then
	. $HOME/.bash_profile
    fi
    if [ "$TERM" == "dumb" ]; then
	PS1='${HOSTNAME%%.*}\$ '
    elif [ "$TERM" == "screen" ]; then
	PS1='\[\e[34;1m\]\W\$\[\e[0m\] '
	echo -ne "\033k${HOSTNAME%%.*}\033\\"
	unset PROMPT_COMMAND
    else
	PS1='\[\e[34;1m\]\W\$\[\e[0m\] '
	if [ -z "$PROMPT_COMMAND" ]; then
	    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
	fi
    fi
fi

alias a=alias
alias h=history
alias j=jobs
#alias edit="emacsclient --no-wait"
alias e="emacs -nw"

case $(uname -s) in
    FreeBSD) COLORARG=" -G" ;;
    Darwin) COLORARG=" -G" ;;
    Linux) COLORARG=" --color=tty" ;;
    *) COLORARG=""
esac

alias l="ls -p$COLORARG"
alias ls="ls -p$COLORARG"
alias la="ls -Ap$COLORARG"
alias ll="ls -lp$COLORARG"
alias siri="sudo"

if [ -f $HOME/.git-completion.bash ]; then
    . $HOME/.git-completion.bash
fi
