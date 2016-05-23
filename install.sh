#!/usr/bin/env bash

echo "正在安装配置Vim请稍候~"

if which apt-get >/dev/null; then
    sudo apt-get install -y vim vim-gnome git
elif which yum >/dev/null; then
    sudo yum install -y vim git
fi

if which brew >/dev/null; then
    brew install vim git
fi

cp ~/.vimrc ~/.vimrc.bak
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/jamechou/vim
mv -f ~/.vim ~/.vim_old
mv -f ~/.vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "正在安装相关插件，可能会花费几分钟的时间请稍候~" >> log
echo "安装完成后，会自动退出!" >> log
echo "Please wait!" >> log
vim log -c "BundleInstall" -c "q" -c "q"
rm -f log
echo "安装并配置完成，请愉快的编码吧~ :)"

