" Annotate every line
  nmap <leader>bb :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>
" Annotate marked lines
  nmap <leader>bn :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>
" Remove annotations
  nmap <leader>bo :%.!seeing_is_believing --clean<CR>
" Mark the current line for annotation
  nmap <leader>be A # => <Esc>
" Mark the highlighted lines for annotation
  vmap <leader>be :norm A # => <Esc>
