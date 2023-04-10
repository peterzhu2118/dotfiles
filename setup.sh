DOTFILES_DIR=$(dirname "$(readlink -f "$0")")

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup zshrc
ln -sf $DOTFILES_DIR/zshrc ~/.zshrc

# Setup global gitconfig
ln -sf $DOTFILES_DIR/gitconfig ~/.gitconfig

# Setup global gitignore
git config --global core.excludesFile $DOTFILES_DIR/.gitignore

# Install vim
sudo apt install -y neovim universal-ctags silversearcher-ag
# Setup vim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/nvim
ln -sf $DOTFILES_DIR/vimrc ~/.config/nvim/init.vim

# Nice things to have
# sudo apt install -y htop psmisc

# Dependencies for MRI development
# sudo apt install -y git ruby autoconf bison gcc make zlib1g-dev libffi-dev libreadline-dev libgdbm-dev libssl-dev
# sudo apt install -y lldb gdb
