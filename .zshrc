alias now="date | cut -d ' ' -f 5"
alias test='clear; python3 -m unittest tests/test_main.py'
alias ls='ls --color=auto'
alias cls='clear; ls'
alias cla='clear; ls -la1'
alias py='python3'
alias pip='pip3'
alias run='clear;py'
alias ..='cd ..'
alias activate='. `find -path "*/bin/activate"`' #finds and activates a virtual env in current tree, where the pwd is the root

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
export PATH="$PATH:$HOME/bin:/goinfre/$USERNAME/.linuxbrew/Homebrew/bin/"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip3
# pip zsh completion end
