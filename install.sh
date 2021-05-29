# Create symlinks

ln -sf $(readlink -f nvim) $HOME/.config

# Install Vim Plug

## download the script
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## run PlugInstall
nvim +PlugInstall +qall
