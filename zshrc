# -*-mode:shell-script-*-
# ~/Dropbox/dotfiles/zshrc

set -o emacs

alias a=alias
alias h=history
alias j=jobs
alias siri="sudo"
alias tags="tools/actions/generate_compile_commands_json.py"

[[ -d /opt/brew/share/zsh/site-functions/ ]] && fpath+=(/opt/brew/share/zsh/site-functions/)

if [ "`uname`" = "Darwin" ]; then
    compctl -f -x 'p[2]' -s "`/bin/ls -d1 /Applications/*.app | sed 's|^.*/\([^/]*\)\.app.*|\\1|;s/ /\\\\ /g'`" -- open
    alias run='open -a'
fi

cdpath=( ${HOME} ${HOME}/src ${HOME}/Vagrants ${HOME}/Vagrants/UATC /vagrant /vagrant/src ${HOME}/Dropbox/src )

PS1='%F{green}%!%f %B%F{blue}%1~%#%f%b '

if [ -d ${HOME}/.zinit.d/ ]; then
    for f in ${HOME}/.zinit.d/[0-9]* ; do
        source "$f"
    done
    unset f
fi

