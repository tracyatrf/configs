augroup NERDy
  autocmd!
  autocmd FileType tagbar,nerdtree setlocal signcolumn=no
  autocmd VimEnter * if !argc() | NERDTree | endif
  "autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
augroup END

let NERDTreeMapOpenSplit='s'
let NERDTreeMapOpenVSplit='v'

" NERD
let g:deepspace_italics = 1 " Enable terminal italics
let g:NERDTreeHijackNetrw=0
let NERDTreeMapOpenExpl=''
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen=0
let NERDTreeStatusline="NERD"
let g:netrw_liststyle = 3
let g:netrw_banner = 0
nnoremap <tab> :NERDTreeToggle<CR>
nnoremap <leader><tab> :NERDTreeFind<CR>
