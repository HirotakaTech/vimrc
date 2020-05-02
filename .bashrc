
# some more ls aliases
alias cfv='nvim ~/.config/nvim/init.vim'
alias vim='nvim'
alias v='nvim'
alias cfx='nvim ~/.Xresources'
alias cb='nvim ~/.bashrc'
alias lab="cd ~/documenti/eclipse/ && tmux"
alias r='ranger'
alias fd=fdfind
alias d='sudo docker run -p 8080:8080 -v ~/documenti/lavoro/network/:/usr/local/tomcat/webapps/ hirotaka00/tomcat-server:v1'


bind '"\C-f":"cd_with_fzf\n"'
bind '"\C-o":"open_with_fzf\n"'

#Funzioni utilissime
open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}
cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" )"
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PS1="\w \\$ "
