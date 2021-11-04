set number

set autoindent
set smartindent
set	cindent

set splitright

set clipboard=unnamed  "yank した文字列をクリップボードにコピー

set hls

set mouse=a

set noswapfile
set noshowmode

set virtualedit=onemore

set autoread  "auto-read when editting file is changed

set showcmd  "show command typing now on status area.

let mapleader="\<Space>"  "map Space to Leader

"---layout---
set laststatus=2  "show status line always
set title  "show title-name 
set visualbell  "beep sound visualization

set ignorecase

set wrapscan

""set pumblend=10

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
tnoremap <silent> jj <C-\><C-n>
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
""call dein#add('Shougo/deoplete.nvim')
""call dein#add('zchee/deoplete-clang')
"theme
"call dein#add('projekt0n/github-nvim-theme')
""call dein#add('ful1e5/onedark.nvim')
call dein#add('morhetz/gruvbox')
"構文チェックを行う。
""call dein#add('scrooloose/syntastic')
"() 色付け:
call dein#add('itchyny/lightline.vim')
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

"End dein Scripts-------------------------

let g:molokai_original = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

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
""colorscheme onedark
colorscheme gruvbox

"透明
""highlight Normal ctermbg=NONE guibg=NONE
""highlight NonText ctermbg=NONE guibg=NONE
""highlight LineNr ctermbg=NONE guibg=NONE
""highlight Folded ctermbg=NONE guibg=NONE
""highlight EndOfBuffer ctermbg=NONE guibg=NONE

"neoterm"
let g:neoterm_default_mod='belowright'
let g:neoterm_autoscroll=1

"かっこ色"
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

"fzf keymap"
noremap <fzf-p> <Nop>
map     ;       <fzf-p>
noremap ;;      ;
noremap <dev>   <Nop>
map     m       <dev>

nnoremap <silent> <fzf-p>r     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> <fzf-p>w     :<C-u>CocCommand fzf-preview.ProjectMrwFiles<CR>
nnoremap <silent> <fzf-p>a     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> <fzf-p>g     :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> <fzf-p>s     :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <fzf-p>b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> <fzf-p>B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> <fzf-p><C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> <fzf-p>/     :<C-u>CocCommand fzf-preview.Lines --resume --add-fzf-arg=--no-sort<CR>
nnoremap <silent> <fzf-p>*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="<C-r>=expand('<cword>')<CR>"<CR>
xnoremap <silent> <fzf-p>*     "sy:CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="<C-r>=substitute(@s, '\(^\\v\)\\|\\\(<\\|>\)', '', 'g')<CR>"<CR>
nnoremap <silent> <fzf-p>n     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="<C-r>=substitute(@/, '\(^\\v\)\\|\\\(<\\|>\)', '', 'g')<CR>"<CR>
nnoremap <silent> <fzf-p>?     :<C-u>CocCommand fzf-preview.BufferLines --resume --add-fzf-arg=--no-sort<CR>
nnoremap          <fzf-p>f     :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          <fzf-p>f     "sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> <fzf-p>q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> <fzf-p>l     :<C-u>CocCommand fzf-preview.LocationList<CR>
nnoremap <silent> <fzf-p>:     :<C-u>CocCommand fzf-preview.CommandPalette<CR>
nnoremap <silent> <fzf-p>p     :<C-u>CocCommand fzf-preview.Yankround<CR>
nnoremap <silent> <fzf-p>m     :<C-u>CocCommand fzf-preview.Bookmarks --resume<CR>
nnoremap <silent> <fzf-p><C-]> :<C-u>CocCommand fzf-preview.VistaCtags --add-fzf-arg=--query="<C-r>=expand('<cword>')<CR>"<CR>
nnoremap <silent> <fzf-p>o     :<C-u>CocCommand fzf-preview.VistaBufferCtags<CR>

nnoremap <silent> <dev>q  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> <dev>Q  :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>
nnoremap <silent> <dev>rf :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> <dev>t  :<C-u>CocCommand fzf-preview.CocTypeDefinitions<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


"nvim-treesitter"

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
