"set signcolumn=yes
"normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrw', 250)
" run neomake manually
nmap <space>l :Neomake<CR>
