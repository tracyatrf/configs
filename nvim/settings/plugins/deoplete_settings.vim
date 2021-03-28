let g:deoplete#enable_at_startup = 1
let g:deoplete#min_pattern_length = 2

call deoplete#custom#source('_', 'matchers', ['matcher_head'])
call deoplete#custom#option("max_list", 5)

call deoplete#custom#option('auto_complete_delay', 5)
call deoplete#custom#option('auto_refresh_delay', 5)

inoremap <silent><expr> <C-y> pumvisible() ? deoplete#close_popup() : ""
inoremap <silent><expr> <TAB> pumvisible() ? (<SID>insert_text()) : deoplete#manual_complete()

function! s:insert_text()
  let l:return_val = deoplete#insert_candidate(0)
  if l:return_val == ""
    let l:return_val = deoplete#smart_close_popup()
  endif
  return l:return_val
endfunction

inoremap <expr> <S-Tab> pumvisible() ? deoplete#close_popup() : "\<S-Tab>"
