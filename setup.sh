# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup zshrc
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Install vim
sudo apt install -y neovim universal-ctags silversearcher-ag
# Setup vim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/nvim
ln -sf ~/dotfiles/vimrc ~/.config/nvim/init.vim

# Setup global gitignore
git config --global core.excludesFile ~/dotfiles/.gitignore

git config --global user.email "peter@peterzhu.ca"

# Nice things to have
# sudo apt install -y htop psmisc

# Dependencies for MRI development
# sudo apt install -y git ruby autoconf bison gcc make zlib1g-dev libffi-dev libreadline-dev libgdbm-dev libssl-dev
# sudo apt install -y lldb gdb
