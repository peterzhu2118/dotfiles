# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup zshrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Install vim
sudo apt install -y vim universal-ctags ripgrep
# Setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
vim -E -s -c "source ~/.vimrc" +PlugInstall -c ":qa!"

# Setup global gitignore
git config --global core.excludesFile ~/dotfiles/.gitignore

# Nice things to have
sudo apt install -y htop

# Dependencies for MRI development
sudo apt install -y git ruby autoconf bison gcc make zlib1g-dev libffi-dev libreadline-dev libgdbm-dev libssl-dev

# chruby
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
cd ..
rm -rf chruby-0.3.9.tar.gz chruby-0.3.9

# ruby-install
wget -O ruby-install-0.8.1.tar.gz https://github.com/postmodern/rubyw, -install/archive/v0.8.1.tar.gz
tar -xzvf ruby-install-0.8.1.tar.gz
cd ruby-install-0.8.1/
sudo make install
cd ..
rm -rf ruby-install-0.8.1.tar.gz ruby-install-0.8.1

# Ruby 2.7.2
ruby-install ruby 2.7.2

