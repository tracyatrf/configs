" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag -Q -l --path-to-ignore ~/.config/nvim/.ignore --nocolor --hidden -g "" %s'
  let g:ctrlp_use_caching = 1
endif

nnoremap \ :Telescope live_grep<CR>
nnoremap <C-p> :Telescope find_files<CR>

nnoremap <leader>f :noh<CR>
nnoremap <leader>j *
nnoremap <leader>/ *
nnoremap <leader>p "0p
vnoremap <leader>p "0p
nnoremap <S-Tab> <cmd>Telescope buffers<cr>
nnoremap <leader>i <cmd>Telescope help_tags<cr>

nnoremap <C-F> <C-D>

let g:asyncrun_trim = 1
command! -nargs=1 AG
      \ call setqflist([])
      \ | execute 'AsyncRun! ag --path-to-ignore ~/.config/nvim/.ignore ' . <q-args>
      \ | execute 'redraw'
      \ | execute 'copen'


fun! s:sub(options, search, replace)
    execute ':normal mZ'
    execute 'args `find . -type f`'
    execute 'argdo %s/' . a:search . '/' . a:replace . '/' . a:options
    execute ":normal `Z"
  endfun
command! -nargs=+ FR call s:sub(<f-args>)

" Quicklish shortcuts
nnoremap <C-e> :cp<CR>zvzz
nnoremap <C-n> :cn<CR>zvzz

nmap <script> <silent> <C-k> :call ToggleLocationList()<CR>
nmap <script> <silent> <C-y> :call ToggleQuickfixList()<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
