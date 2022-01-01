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
