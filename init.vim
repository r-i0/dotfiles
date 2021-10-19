set number

set autoindent

set splitright

set hls

set mouse=a

set noswapfile

set autoread  "auto-read when editting file is changed

set showcmd  "show command typing now on status area.

let mapleader="\<Space>"  "map Space to Leader

"---layout---
set laststatus=2  "show status line always
set title  "show title-name 
set visualbell  "beep sound visualization

set ignorecase

set wrapscan

set pumblend=30

set tabstop=4
set shiftwidth=4

set list
set listchars=tab:\▸\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

inoremap <silent> jj <ESC>:<C-u>w<CR>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

map j gj
map k gk

"---terminal---
set shell=/bin/zsh
tnoremap <silent> <ESC><ESC> <C-\><C-n>
nnoremap <silent> <Leader>t :call ToggleTerminalMRU()<CR>

let g:mru_buffer = 1
let g:mru_buffer_prev = 1
autocmd bufleave * let g:mru_buffer_prev = bufnr()

function! IsTerminal(buf_num) abort
  let l:term_buf = bufnr("terminal.buffer")
  if a:buf_num == term_buf
    return 1
  endif
  return 0
endfunction

function! ToggleTerminalMRU() abort
  let l:cur_buf = bufnr()
  let l:term_buf = bufnr("terminal.buffer")
  if cur_buf == term_buf
    if bufexists(g:mru_buffer) == 1
      execute('buffer '.g:mru_buffer)
    else
      :echo "does'nt exist restorable editor"
    endif
  else
    if term_buf == -1
      execute("terminal")
      execute("f terminal.buffer")
    else
      execute('buffer '.l:term_buf)
    endif
  endif
endfunction

function! ToggleFloatingTerminalMRU() abort
  let l:cur_buf = bufnr()
  let l:term_buf = bufnr("terminal.buffer")
  if cur_buf == term_buf
    if bufexists(g:mru_buffer) == 1
      call nvim_win_close(0,v:true)
    else
      :echo "does'nt exist restorable editor"
    endif
  else
    call FloatingTerminal(term_buf)
  endif
endfunction

function! FloatingTerminal(buf) abort
  let term_buf = a:buf
  if a:buf == -1
    let l:term_buf = nvim_create_buf(v:false, v:true)
  endif
  call nvim_open_win(l:term_buf, v:true, {'relative': 'win', 'height': 30, 'width': 145, 'col': 10, 'row': 3})
  set winblend=0

  if a:buf == -1
    terminal
    f terminal.buffer
  endif
endfunction


autocmd TermOpen * startinsert
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

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
"theme
"call dein#add('projekt0n/github-nvim-theme')
call dein#add('ful1e5/onedark.nvim')
"構文チェックを行う。
call dein#add('scrooloose/syntastic')
"() 色付け:
call dein#add('itchyny/lightline.vim')
"tree
call dein#add('preservim/nerdtree')
call dein#add('ryanoasis/vim-devicons')

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

"theme
let g:github_dark_sidebar = 0

" Example config in VimScript
let g:github_function_style = "italic"
let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:github_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme onedark

"透明
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE


