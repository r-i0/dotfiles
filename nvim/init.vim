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
set backspace=indent,eol,start

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
hi NonText guibg=NONE guifg=DarkGreen
hi SpecialKey guibg=NONE guifg=darkmagenta

set scrolloff=5

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
call dein#add('morhetz/gruvbox')
"構文チェックを行う。
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

"tree
call dein#add('preservim/nerdtree')
call dein#add('ryanoasis/vim-devicons')

call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim')
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

call dein#add('glepnir/dashboard-nvim')
call dein#add('easymotion/vim-easymotion')
call dein#add('osyo-manga/vim-anzu')

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
"
"dashboard

let g:mapleader="\<Space>"
let g:dashboard_default_executive ='fzf'

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
			\ '                                             ▟▙            ',
			\ '                                             ▝▘            ',
			\ '     ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
			\ '     ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
			\ '     ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
			\ '     ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
			\ '     ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
			\ '',
			\"                         ;::::;",
			\"                       ;::::; :;",
			\"                     ;:::::'   :;",
			\"                    ;:::::;     ;.",
			\"                   ,:::::'       ;           OOO\ ",
			\"                   ::::::;       ;          OOOOO\ ",
			\"                   ;:::::;       ;         OOOOOOOO",
			\"                  ,;::::::;     ;'         / OOOOOOO",
			\"                ;:::::::::`. ,,,;.        /  / DOOOOOO",
			\"              .';:::::::::::::::::;,     /  /     DOOOO",
			\"             ,::::::;::::::;;;;::::;,   /  /        DOOO",
			\"            ;`::::::`'::::::;;;::::: ,#/  /          DOOO",
			\"            :`:::::::`;::::::;;::: ;::#  /            DOOO",
			\"            ::`:::::::`;:::::::: ;::::# /              DOO",
			\"            `:`:::::::`;:::::: ;::::::#/               DOO",
			\"             :::`:::::::`;; ;:::::::::##                OO",
			\"             ::::`:::::::`;::::::::;:::#                OO",
			\"             `:::::`::::::::::::;'`:;::#                O",
			\"              `:::::`::::::::;' /  / `:#",
			\"               ::::::`:::::;'  /  /   `#",
			\]

" Load the colorscheme
colorscheme gruvbox

runtime configs/nerdtree.vim
runtime configs/coc.vim

let g:user42 = 'rsudo'
let g:mail42 = 'rsudo@student.42tokyo.jp'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
""luna,distingished, angr
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}


map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true, -- false will disable the whole extension
disable = {
	'html'
	},  -- list of language that will be disabled
},
}
EOF

nmap <C-i> :!goimports -w % <CR>

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

"vim-anzu
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" statusline
set statusline=%{anzu#search_status()}


"----------------------------------------------------
" Insert include guard to the current file
"----------------------------------------------------
command!  -nargs=0 IncGuard call IncludeGuard()
function! IncludeGuard()
    "カレントファイル名を取得
    let name = fnamemodify(expand('%'),':t')

    "大文字にする
    let name = toupper(name)

    "がーど
    let included = substitute(name,'\.','_','g')
    "書き込み
    let res_head = '#ifndef '.included."\n#define ".included."\n\n"
    let res_foot = "\n".'#endif //'.included
    silent! execute '1s/^/\=res_head'
    silent! execute '$s/$/\=res_foot'
endfunction

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory = '~/.config/nvim/snippets/'

"syn keyword 要素名 要素 要素.. 
"TODOを指定の文字色に変更 
syn keyword todo TODO
highlight todo cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828

"gitgutter
set updatetime=250

let g:python_host_prog="/usr/bin/python2.7"
" let g:python3_host_prog="/usr/local/bin/python3"

