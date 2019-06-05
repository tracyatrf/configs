" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden --ignore .git -g "" %s'
  let g:ctrlp_use_caching = 1
endif

"nnoremap <leader>i :AsyncGrep "<C-R><C-W>"<CR>
nnoremap \ :AsyncGrep<space>
nnoremap <leader>f :noh<CR>
nnoremap <leader>p "0p
vnoremap <leader>p "0p
nnoremap <S-Tab> :CtrlPBuffer<CR>
nnoremap <leader>i :CtrlPTag<CR>

let g:asyncrun_trim = 1
command! -nargs=1 AsyncGrep
      \ call setqflist([])
      \ | execute 'AsyncRun! ag ' . <q-args>
      \ | execute 'redraw'
      \ | execute 'copen'


" Quicklish shortcuts
nnoremap <C-e> :cp<CR>zvzz
nnoremap <C-n> :cn<CR>zvzz

nmap <script> <silent> <C-k> :call ToggleLocationList()<CR>
nmap <script> <silent> <C-y> :call ToggleQuickfixList()<CR>
