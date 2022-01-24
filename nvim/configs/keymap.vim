inoremap <silent> jj <ESC>:<C-u>w<CR>:<C-u>noh<CR>
inoremap <silent> <C-f> <RIGHT>
inoremap <silent> <C-a> <LEFT>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

map j gj
map k gk

" 検索後にジャンプしたときzz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Right>  <C-w><<CR>
nnoremap <S-Left> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap <silent> <Leader>e :e<Space>

vnoremap > >gv
vnoremap < <gv

nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap <C-f> <Space><Space>:%s/<C-r>///gc<Left><Left><Left>

" 行を移動
nnoremap <A-Up> "zdd<Up>"zP
nnoremap <A-Down> "zdd"zp
" 複数行を移動
vnoremap <A-Up> "zx<Up>"zP`[V`]
vnoremap <A-Down> "zx"zp`[V`]
