#!/usr/bin/env bash

echo "马上卸载!"

rm -fr ~/vim
rm -fr ~/.vim
rm -fr ~/vim_old
rm -f ~/.vimrc
rm -fr ~/jc-vim
mv ~/.vimrc.bak ~/.vimrc

echo "卸载完成!"
