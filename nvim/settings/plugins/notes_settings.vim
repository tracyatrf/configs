let g:notes_smart_quotes = 0
let g:notes_list_bullets = ["-"]

command! Notes :call <SID>go_to_notes()

function! s:go_to_notes()
  let l:note_dir = '/Users/tmeade/.config/nvim/bundle/vim-notes/misc/notes/user/'
  execute 'cd' l:note_dir
  execute 'NERDTree' l:note_dir
endfunction

