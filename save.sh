#/bin/bash
# Commento
cp ~/.config/nvim/init.vim ./.config/nvim/init.vim
cp ~/.config/nvim/coc-settings.json ./.config/nvim/coc-settings.json
cp ~/.bashrc ./.bashrc
cp ~/.tmux.conf ./.tmux.conf
cp ~/.config/alacritty/alacritty.yml ./.config/alacritty/alacritty.yml
cp ~/.local/share/applications ./.local/share/applications
git add .
git commit -m "$1"
git push
