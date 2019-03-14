#!/usr/bin/env bash

echo "正在安装配置Vim请稍候~"

if which apt-get >/dev/null; then
    sudo apt-get install -y vim vim-gnome git tmux cmake
elif which yum >/dev/null; then
    sudo yum install -y vim git tmux cmake
fi

if which brew >/dev/null; then
    brew install vim git tmux
fi

cp ~/.vimrc ~/.vimrc.bak
mv -f ~/dotfiles ~/dotfiles_old
cd ~/ && git clone https://github.com/jamechou/dotfiles
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/dotfiles/vimrc ~/.vimrc
mkdir ~/.vim
cp -R ~/dotfiles/bundle ~/.vim
cp -R ~/dotfiles/colors ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "正在安装相关插件，可能会花费几分钟的时间请稍候~" >> log
echo "安装完成后，会自动退出!" >> log
echo "Please wait!" >> log
vim log -c "BundleInstall" -c "q" -c "q"
rm -f log
cd ~/.vim/bundle/YouCompleteMe
sh ./install.sh --clang-complete
cd ~
echo "开始配置tmux"
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.tmux.conf.local ~/.tmux.conf.local.bak
cp ~/dotfiles/tmux.conf ~/.tmux.conf
cp ~/dotfiles/tmux.conf.local ~/.tmux.conf.local
echo "安装并配置完成，请愉快的编码吧~ :)"

echo "安装以及配置Nodejs和NVM"
cd ~
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
sudo chmod 755 install_nvm.sh
./install_nvm.sh
source ~/.profile
source ~/.zshrc
source ~/.bashrc
nvm install 8.11.1
nvm use 8.11.1
node -v
cp ~/dotfiles/npmrc ~/.npmrc

echo "安装Hexo以及Gitbook环境"
npm install -g hexo-cli
npm install -g gitbook-cli
