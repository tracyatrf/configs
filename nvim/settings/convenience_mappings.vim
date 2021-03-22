" Convenience
nnoremap Q :q<cr>
command! Q exec 'q'
nmap <leader>qq :qa!<CR>
nnoremap X :x<cr>
nnoremap # :<C-U>exec v:count<CR>

nnoremap gn <C-d>zz
nnoremap ge <C-u>zz

"stack"
nmap <C-space> ]mzz
nmap <C-a> [mzz

nnoremap <C-l> <C-i>

nnoremap <F1> $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>

nnoremap S :w<CR>
nnoremap T :tabnew<CR>
nnoremap gf gF

" this fixes the wierd bang method ctag thing
nnoremap <buffer><silent>  <C-]> :<C-U>exe v:count."tag <Plug><cword>"<CR>
nmap tt <C-]>zz^

nnoremap <C-t> <C-t>zz
nnoremap th gt
nnoremap gt gT
nnoremap hm mm^y$`m

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Remove Whitespace
command! Ws :%s/\s\+$//e

" Tags
command! CT :!ctags -R .
command! RT :!ripper-tags -R .

" Reindent File
command! If exec "normal gg=G"

" open and source vimrc
command! Vo :tabe $MYVIMRC
command! Vs :so $MYVIMRC | :AirlineRefresh
