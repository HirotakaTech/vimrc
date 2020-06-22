stty -ixon #disabilita c-s e c-q ❗

#Alias 😃
alias ls='ls --color'
alias cfv='nvim ~/.config/nvim/init.vim'
alias cfb='nvim ~/.bashrc'
alias vim='nvim'
alias v='nvim'
alias cfx='nvim ~/.Xresources'
alias cb='nvim ~/.bashrc'
alias lab="cd ~/documenti/eclipse/ && tmux"
alias r='ranger'
alias fd=fdfind
alias docker='sudo docker'
alias d='docker run -p 8080:8080 -v ~/documenti/lavoro/network/:/usr/local/tomcat/webapps/ hirotaka00/tomcat-server:v1'


bind '"\C-f":"cd_with_fzf\n"'
bind '"\C-o":"open_with_fzf\n"'


#Funzioni utilissime 😀
open_with_fzf() {
    cd $HOME && fzf | xargs nvim
}
cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" )"
}

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Prompt 😌
export PS1="\w \\$ "

#PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\]\[\033[0m\] '
