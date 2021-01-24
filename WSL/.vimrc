" Setting some commands
set number
set expandtab
set hlsearch
set formatoptions-=cro
syntax enable
filetype plugin indent on    " required

inoremap <silent> jj <ESC>
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^a
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^a

noremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

runtime! dein-scripts.vim
runtime! tabpage.vim

set clipboard=unnamedplus

set backspace=indent,eol,start
noremap! <C-?> <C-h>

syntax on

" color scheme "
set background=dark
colorscheme sublimemonokai
"colorscheme hybrid
"colorscheme solarized
"colorscheme gotham256
"colorscheme iceberg

"yank save on clickboard"
set clipboard=unnamedplus
set t_Co=256
" setting
"文字コードをUFT-8に設定
set fenc=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 見た目系
" 行番号を表示
set nu
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
" set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable
" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-"
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 検索系
" 検索文字列jが小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"https://teratail.com/questions/124520"
"{}片方消したらもう片方も消したい"

"---新規カッコ,"クォーテション作成
"---新規カッコ空閉じ,"クォーテション作成
inoremap {{ {}
inoremap (( ()
inoremap [[ []
inoremap "<CR> ""
inoremap '<CR> ''
inoremap `<CR> ``
"---新規カッコ閉じ　ＣＳＳ書く用---
inoremap {<CR> {};<Left><Left><CR><ESC><S-o>
inoremap (<CR> ();<Left><Left><CR><ESC><S-o>
inoremap [<CR> [];<Left><Left><CR><ESC><S-o>
"---既存タグにカッコつけ--- 行末にカッコつけ
inoremap {<TAB> {<Right><ESC>$a}
inoremap (<TAB> (<Right><ESC>$a)
inoremap [<TAB> [<Right><ESC>$a]
inoremap "<TAB> "<Right><ESC>$a"
inoremap '<TAB> '<Right><ESC>$a'
inoremap `<TAB> `<Right><ESC>$a`
"---既存タグにカッコつけ--- 単語末にカッコつけ
inoremap {} {<Right><ESC>Ea}
inoremap () (<Right><ESC>Ea)
inoremap (/ (<Right><ESC>t/a)
inoremap (. (<Right><ESC>t.a)
inoremap [] [<Right><ESC>Ea]
inoremap ") "<Right><ESC>t)a"
inoremap "} "<Right><ESC>t}a"
inoremap "] "<Right><ESC>t]a"
inoremap ", "<Right><ESC>t,a"
inoremap ": "<Right><ESC>t:a"
inoremap "; "<Right><ESC>t;a"
inoremap ') '<Right><ESC>t)a'
inoremap '} '<Right><ESC>t}a'
inoremap '] '<Right><ESC>t]a'
inoremap ', '<Right><ESC>t,a'
inoremap ': '<Right><ESC>t:a'
inoremap '; '<Right><ESC>t;a'
"---既存タグにカッコつけ---
inoremap {<Right> {
inoremap (<Right> (
inoremap [<Right> [
inoremap "<Right> "
inoremap '<Right> '
inoremap `<Right> `

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

set wildmenu

augroup vimrcEx
  autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
            \   exe "normal! g`\"" |
                \ endif
                augroup END
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
""autocmd FileType python setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
inoremap <silent> jj <Esc>l
"https://qiita.com/ahiruman5/items/4f3c845500c172a02935"
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
"mouse"
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"
    function XTermPastebegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
let g:sublimemonokai_term_italic = 1

let NERDTreeWinSize=40

set encoding=utf-8
set fileencodings=utf-8
set ttimeoutlen=50

"以下はdeinの読み込みに必要なので消さないこと"
"dein Scripts-----------------------------
""if &compatible
""  set nocompatible               " Be iMproved
""endif
""
""" Required:
""set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
""
""" Required:
""if dein#load_state('$HOME/.cache/dein')
""  call dein#begin('$HOME/.cache/dein')
""
""  " Let dein manage dein
""  " Required:
""  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
""
""  " Add or remove your plugins here:
""  call dein#add('Shougo/neosnippet.vim')
""  call dein#add('Shougo/neosnippet-snippets')
""
""  " You can specify revision/branch/tag.
""  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
""
""  " Required:
""  call dein#end()
""  call dein#save_state()
""endif
""
""" Required:
""filetype plugin indent on
""syntax enable
""
""" If you want to install not installed plugins on startup.
""if dein#check_install()
""  call dein#install()
""endif
""
"End dein Scripts-------------------------
