let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
if &compatible
  set nocompatible               " Be iMproved
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml_dir = expand('~/.vim/toml')
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  "call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  "call dein#add('Shougo/deoplete.nvim')
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

