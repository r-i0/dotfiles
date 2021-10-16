set number

set autoindent

set splitright

set hls

set mouse=a

set noswapfile

set ignorecase

set wrapscan

inoremap <silent> jj <ESC>:<C-u>w<CR>

map j gj
map k gk

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/sudourio/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/sudourio/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/sudourio/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-clang')
call dein#add('tomasr/molokai')
"構文チェックを行う。
call dein#add('scrooloose/syntastic')
"()を補間する。
call dein#add('Townk/vim-autoclose')
"() 色付け:
call dein#add('itchyny/lightline.vim')

call dein#add('preservim/nerdtree')

call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:molokai_original = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

nnoremap <silent> <C-e> :NERDTree<CR>

" 表示幅
let g:NERDTreeWinSize=50

" ブックマークを表示
let g:NERDTreeShowBookmarks=1

" 親ディレクトリへ移動
let g:NERDTreeMapUpdir=''

" ファイルの開き方
let g:NERDTree='<C-t>'
let g:NERDTreeMapOpenVSplit='<C-l>'

" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1

" 隠しファイルを表示
let g:NERDTreeShowHidden=1

" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']

" NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif



colorscheme molokai

