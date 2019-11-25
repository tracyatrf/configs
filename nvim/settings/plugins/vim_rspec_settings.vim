let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "tabnew term://bundle exec rspec {spec}"
" Run the current file

"map <Leader>sc :tabnew term://bundle exec rspec %<CR>:startinsert<CR>
map <Leader>sc :call RunCurrentSpecFile()<CR>

" Run the closest spec
"map <Leader>ss :exec "tabnew term://bundle exec rspec " . expand("%") . ":" . line(".")<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sn :call RunNearestSpec()<CR>

map <Leader>sl :call RunLastSpec()<CR>

" Run all the Specs
"map <Leader>sa :tabnew term://bundle exec rspec<CR>:startinsert<CR>
map <Leader>sa :call RunAllSpecs()<CR>

command! Seedless :exec Seedless()
command! RspecDefault :exec RspecDefault()

function Seedless()
  let g:rspec_command = "tabnew term://bundle exec rspec --tag=~seeds {spec}"
endfunction

function RspecDefault()
  let g:rspec_command = "tabnew term://bundle exec rspec {spec}"
endfunction
