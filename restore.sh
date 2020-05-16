#/bin/bash
sudo apt install -y fd-find fzf tree exuberant-ctags ripgrep
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
cp ./.config/nvim/init.vim ~/.config/nvim/init.vim
cp ./.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
cp ./.config/nvim/emoji.sh ~/.config/nvim/emoji.sh
cp ./.bashrc ~/.bashrc
cp ./.tmux.conf ~/.tmux.conf
cp ./.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
echo "File copiati"
