let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "tabnew term://bundle exec rspec {spec}"

map <Leader>sc :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

function! Seedless()
  let g:rspec_command = "tabnew term://bundle exec rspec --tag=~seeds {spec}"
endfunction

function! RspecDefault()
  let g:rspec_command = "tabnew term://bundle exec rspec {spec}"
endfunction

augroup Rspec
  command! Seedless :exec Seedless()
  command! RspecDefault :exec RspecDefault()
augroup END
