#!/bin/bash

# link
DOT_FILES=(.bashrc .bash_profile .vimrc .cshrc .emacs .gitconfig .tmux.conf .vim .zshrc) 

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/mydots/$file $HOME/$file
done

