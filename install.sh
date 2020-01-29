#!/bin/sh
set -e

rm -rf ~/.vimrc
mv -v ~/.config/nvim ~/.config/nvim.old 2> /dev/null
ln -sf ~/.vim ~/.config/nvim
vim +PlugInstall +qall
