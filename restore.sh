#/bin/bash
sudo apt install -y fd-find fzf tree exuberant-ctags
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
cp ./.config/nvim/init.vim ~/.config/nvim/init.vim
cp ./.bashrc ~/.bashrc
cp ./.tmux.conf ~/.tmux.conf
cp ./.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
echo "File copiati"

