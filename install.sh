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
mv -f ~/jc-vim ~/jc-vim_old
cd ~/ && git clone https://github.com/jamechou/jc-vim
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/jc-vim/vimrc ~/.vimrc
mkdir ~/.vim
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
cp ~/jc-vim/tmux.conf ~/.tmux.conf
cp ~/jc-vim/tmux.conf.local ~/.tmux.conf.local
echo "安装并配置完成，请愉快的编码吧~ :)"

