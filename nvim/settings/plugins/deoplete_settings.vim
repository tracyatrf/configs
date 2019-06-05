let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
