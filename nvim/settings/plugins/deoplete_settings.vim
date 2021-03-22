let g:deoplete#enable_at_startup = 1
let g:deoplete#min_pattern_length = 2

call deoplete#custom#option("max_list", 5)

inoremap <silent><expr> <C-y>
      \ pumvisible() ? deoplete#close_popup() : ""

inoremap <silent><expr> <TAB>
		\ pumvisible() ? deoplete#insert_candidate(0) :
		\ deoplete#manual_complete()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
