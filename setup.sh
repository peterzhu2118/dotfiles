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
sudo apt install -y htop psmisc

# Dependencies for MRI development
sudo apt install -y git ruby autoconf bison gcc make zlib1g-dev libffi-dev libreadline-dev libgdbm-dev libssl-dev
sudo apt install -y lldb gdb

# chruby
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd ..
rm -rf chruby-0.3.9.tar.gz chruby-0.3.9

# ruby-install
wget -O ruby-install-0.8.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz
tar -xzvf ruby-install-0.8.1.tar.gz
cd ruby-install-0.8.1/
sudo make install
cd ..
rm -rf ruby-install-0.8.1.tar.gz ruby-install-0.8.1

# Ruby 3.0.2
ruby-install ruby 3.0.2

