alias test='clear; python3 -m unittest tests/test_main.py'
alias ls='ls --color=auto'
alias cls='clear; ls'
alias cla='clear; ls -la1'
alias py='python3'
alias run='clear;py'
alias ..='cd ..'

#enable colors

if [ -x /usr/bin/dircolors ]; then
    \test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias .='source'
fi

alias ll='ls -l'
alias la='ls -1a'
alias l='ls -CF'
export PATH="$PATH:$HOME/bin:/goinfre/yzwane/.linuxbrew/Homebrew/bin/"
