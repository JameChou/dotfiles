#!/usr/bin/env bash

echo "马上卸载!"

rm -fr ~/vim
rm -fr ~/.vim
rm -fr ~/vim_old
rm -f ~/.vimrc
rm -fr ~/jc-vim
rm -f ~/.tmux.conf
rm -f ~/.tmux.conf.local
mv ~/.vimrc.bak ~/.vimrc
mv ~/.tmux.conf.bak ~/.tmux.conf
mv ~/.tmux.conf.local.bak ~/.tmux.conf.local

echo "卸载完成!"
