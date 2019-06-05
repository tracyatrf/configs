" Convenience
nnoremap Q :q<cr>
command! Q exec 'q'
nmap <leader>qq :qa!<CR>
nnoremap X :x<cr>
nnoremap # :<C-U>exec v:count<CR>
nmap <C-l> ]mzz
nmap <C-space> [mzz
nnoremap S :w<CR>
nnoremap T :tabnew<CR>
nnoremap tt <C-]>zz^
nnoremap <C-t> <C-t>zz
nnoremap th gt
nnoremap gt gT

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Remove Whitespace
command! Ws :%s/\s\+$//e

" Reindent File
command! If exec "normal gg=G"

" open and source vimrc
command! Vo :tabe $MYVIMRC
command! Vs :so $MYVIMRC | :AirlineRefresh
