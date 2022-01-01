set number

set autoindent
set smartindent
set cindent

set splitright

set clipboard=unnamed  "yank した文字列をクリップボードにコピー

set hls

set mouse=a

set noswapfile
set noshowmode

set virtualedit=onemore

"pasteモードから自動的に戻る"
autocmd InsertLeave * set nopaste

set autoread  "auto-read when editting file is changed

set showcmd  "show command typing now on status area.

let mapleader="\<Space>"  "map Space to Leader

"---layout---
set laststatus=2  "show status line always
set title  "show title-name 

set ignorecase

set wrapscan

""set pumblend=10
set tabstop=4
set shiftwidth=4

set list
set listchars=tab:\▸\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

runtime configs/keymap.vim
runtime configs/terminal.vim
runtime configs/tabline.vim

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
""call dein#add('Shougo/deoplete.nvim')
""call dein#add('zchee/deoplete-clang')
"theme
"call dein#add('projekt0n/github-nvim-theme')
""call dein#add('ful1e5/onedark.nvim')
call dein#add('morhetz/gruvbox')
"構文チェックを行う。
""call dein#add('scrooloose/syntastic')
" call dein#add('itchyny/lightline.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

"tree
call dein#add('preservim/nerdtree')
call dein#add('ryanoasis/vim-devicons')

call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

""call dein#add('kassio/neoterm')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('yuki-yano/fzf-preview.vim', { 'rev': 'release/rpc' })
call dein#add('junegunn/rainbow_parentheses.vim')
"git"
call dein#add('lambdalisue/vim-gita')
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

"シンタックス"
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
"コメントアウト"
call dein#add('tpope/vim-commentary')

call dein#add('42Paris/42header')

call dein#add('wakatime/vim-wakatime')

call dein#add('vim-operator-user')
call dein#add('rhysd/vim-clang-format')

""call dein#add('')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let g:dein#auto_recache = 1

"End dein Scripts-------------------------
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

" 表示幅
let g:NERDTreeWinSize=30

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

" Load the colorscheme
""colorscheme onedark
colorscheme gruvbox

"透明
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

runtime configs/coc.vim

let g:user42 = 'rsudo'
let g:mail42 = 'rsudo@student.42tokyo.jp'

let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
