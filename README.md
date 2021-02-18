# mydots

## mydots/
.* is dots for Ubuntu Server. Please edit these dots basically.

## version
vim >= 8.0 (for dein)

## mydots/WSL/
.bashrc is original for WSL in Windows 10.

The other dots are link of mydots/*

ex) .vimrc .vim/ .tmux.conf.

## If you want to eliminate .bashrc or .bash_profile

```
# [WARNING] This program is very danger. 
# Please set filename manially, this program is very danger.
# You can delete the file historically.
file='.bash_profile'
echo 'Removing...'
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch $file" \
  --prune-empty --tag-name-filter cat -- --all
```


## future works
## purple customize
violet, shades-of-purple.vim

## deoplete.nvim
何もわからぬ

## [FIX] Ubuntu server
vim8.2

echo has("python3") = 0 (python3/dyn exists)

lua install ... ?

## [FIX] WSL
[Done] vim8.0 -> vim8.2 (for deoplete.nvim)
[Done] vim --version -> +python3
one error by deprecation


## git
[Done] git-completion

global

## vim
completion

clipboard


## link
[Done] link between base dots (for ubuntu server) <-> WSL

link between base dots (for ubuntu server) <-> MacOS

## linux
purple customize


