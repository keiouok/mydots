#!/bin/bash

# link inside
echo "******************"
echo "make dotfiles link inside"
echo "******************"
IN_DOT_FILES=(.vimrc .gitconfig .tmux.conf .vim) 
for file in ${IN_DOT_FILES[@]}
do
    if [ ! -e $file ]; then
        ln -s ../$file $file
    elif [ -e $file ]; then
        echo $file' exists.'
    fi
done

# link
echo "******************"
echo "make dotfiles link"
echo "******************"
DOT_FILES=(.bashrc_init) 

for file in ${DOT_FILES[@]}
do
    # [FIXED] .vim/.vim... recursive problem was fixed
    if [ ! -e $HOME/$file ]; then
        ln -s $HOME/mydots/WSL/$file $HOME/$file
    elif [ -e $HOME/$file ]; then
        echo $file' exists.'
    fi
done

# dein (no link)
# [ref] https://qiita.com/Coolucky/items/0a96910f13586d635dc0
echo "******************"
echo "dein install start."
echo "******************"
if [ ! -e  ~/.cache/dein ]; then
    mkdir -p ~/.cache/dein
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
    bash dein-installer.sh ~/.cache/dein
else
    echo "dein exists."
fi

echo "******************"
echo "erase dein-installer"
echo "******************"
if [ -e dein-installer.sh ]; then
    rm -rf dein-installer.sh
fi

echo "******************"
echo "git-completion install starts."
echo "******************"
GIT_DOT_FILES=(git-completion.bash git-prompt.sh)
for file in ${GIT_DOT_FILES[@]}; do
    if [ ! -e ~/.$file ]; then
        wget https://raw.githubusercontent.com/git/git/master/contrib/completion/$file -O ~/.$file
        chmod a+x ~/.$file
        # echo "source ~/.git-completion.bash" >> ~/.bashrc"
        source ~/.bashrc
        # ~/.bashrc内のPS1 変数を __git_ps1 を含むように変更する
    fi
done
