set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
Plugin 'cohama/lexima.vim' "括弧の自動補完
Plugin 'justmao945/vim-clang'
Plugin 'itchyny/lightline.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'deoplete-plugins/deoplete-clang'

call vundle#end()
filetype plugin indent on

"その他のカスタム設定を以下に書く

set number
"ターミナルサイズ
set termwinsize=7x0

set smartindent

set title

set cursorline

set showmatch

"set spell
set ignorecase "検索パターンにおいて大文字と小文字を区別しない
set incsearch "インクリメンタルサーチ
set smartcase "大文字を含む文字列で検索した場合は無視しない

set laststatus=2
set clipboard+=unnamed
set wildmenu "候補表示

"Escをjjにキーバインド
inoremap <silent> jj <ESC>
nnoremap <Esc><Esc> :nohlsearch<CR>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>


syntax enable
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme hybrid

set mouse=a
set ttymouse=xterm2

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
