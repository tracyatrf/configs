set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif
let g:colors_name="deep-space-one"

hi Bold gui=bold cterm=bold
hi ColorColumn guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi Conceal gui=NONE cterm=NONE
hi Cursor guibg=#5f87ff ctermbg=69 gui=NONE cterm=NONE
hi CursorColumn guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi CursorLine guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi Directory guifg=#5fd7ff ctermfg=81 gui=NONE cterm=NONE
hi Normal guifg=#ffebeb ctermfg=white guibg=#062229 ctermbg=black gui=NONE 
hi VertSplit ctermbg=white ctermfg=black
hi EndOfBuffer ctermfg=black ctermbg=000
hi LineNr ctermfg=237
"cterm=NONE

