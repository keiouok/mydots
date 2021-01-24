#!/bin/bash

# link
DOT_FILES=(.bashrc .bash_profile .vimrc .cshrc .emacs .gitconfig .tmux.conf .vim .zshrc) 

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/mydots/$file $HOME/$file
done

# dein (no link)
# [ref] https://qiita.com/Coolucky/items/0a96910f13586d635dc0
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
bash dein-installer.sh ~/.cache/dein
