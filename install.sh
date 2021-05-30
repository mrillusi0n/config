# Create symlinks

## nvim
ln -sf $(readlink -f nvim) $HOME/.config/nvim

## zsh
ln -sf $(readlink -f .zshrc) $HOME/.zshrc

## tmux
ln -sf $(readlink -f .tmux.conf) $HOME/.tmux.conf

# Install Vim Plug

## download the script
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## run PlugInstall
nvim +PlugInstall +qall
