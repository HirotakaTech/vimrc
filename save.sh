#/bin/bash
cp ~/.config/nvim/init.vim ./.config/nvim/init.vim
cp ~/.bashrc ./bashrc
cp ~/.tmux.conf ./tmux.conf
git add .
git commit -m "$1"
git push

