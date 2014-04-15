# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

## Command aliases
alias grep="grep --color=auto"                        # color grep output
alias ls="ls --color --time-style=locale"            # list, color, human readable
alias lsl="ls -lh --color --time-style=locale"       # list long, color, human
alias lsa="ls -alh --color --time-style=locale"      # list long, show all, human readable
alias l="ls"
alias j="jobs"                   # show all jobs
alias ..="cd .."                 # save 3 keystrokes...
alias cd..="cd .."               # for annoying typos...
alias diff="colordiff"           # pretty colors...
alias p="pwd"                    # more lazyness...
alias c="clear"                  # another quickie
alias s="screen"                 # Starts screen
alias sr="screen -r"             # Screen Reattach
alias sd="screen -d"                 # Screen Detach
alias du="du -h"                 # Human Readable
alias df="df -hT"                 # Human Readable w/ Filesystem
alias untar="tar xzfv"           # for tarballs
alias unbz2="tar xvfj"           # for .bz2 archives
alias killff="killall firefox-bin" # a grim necessity
alias grep='grep --color=auto'   # color grep
alias more="less"
alias nano="nano -w"
alias vim="vim -X"
# damn you zsh
alias find="noglob find"
alias scp="noglob scp"

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done

PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="[$PR_GREEN%n$PR_NO_COLOR@$PR_GREEN%m$PR_NO_COLOR:$PR_BLUE%~$PR_NO_COLOR]
%(!.#.%%) "
RPS1="$PR_LIGHT_WHITE(%D{%m-%d %H:%M})$PR_WHITE"

# completion
compctl -g '*.pdf' + -g '*(-/)' evince

#aliases
alias clean='rm -f *~'
alias cleanlatex='rm -f *.aux; rm -f *.log; rm -f *.toc; rm -f *.nav; rm -f *.out; rm -f *.snm'

# Mutt instead of bsd mailutils or other poor mail clients
alias mail=mutt
export EDITOR=vim
PATH=~/bin:~/android-sdks/tools:~/android-sdks/platform-tools:${PATH}

# rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
. "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.]

# git
fpath=($fpath $HOME/.zsh/func)
typeset -U fpath
setopt promptsubst
# Load the prompt theme system
autoload -U promptinit
promptinit
# Use the wunjo prompt theme
prompt wunjo


