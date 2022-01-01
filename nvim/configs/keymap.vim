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
nnoremap g* g*zznnoremap g# g#zz

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Right>  <C-w><<CR>
nnoremap <S-Left> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap <silent> <Leader>e :e<Space>

vnoremap > >gv
vnoremap < <gv
