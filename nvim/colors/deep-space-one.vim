set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif
let g:colors_name="deep-space-one"
hi PmenuSel guibg=#232a36 guifg=white
hi Pmenu guibg=#323c4d gui=bold
"hi Bold gui=bold cterm=bold
hi ColorColumn guibg=#102330 ctermbg=236 gui=NONE cterm=NONE
hi Conceal gui=NONE cterm=NONE
hi Cursor guibg=#5f87ff ctermbg=69 gui=NONE cterm=NONE
hi CursorColumn guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi CursorLine guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi Directory guifg=#5fd7ff ctermfg=81 gui=NONE cterm=NONE
hi Normal guifg=white ctermfg=white guibg=#172333 ctermbg=black gui=NONE 
hi VertSplit guibg=#111b28  guifg=#111b28 ctermbg=white ctermfg=black
hi EndOfBuffer guifg=#111b28 guibg=#111b28 ctermfg=black ctermbg=000
hi! link SignColumn LineNr
"hi SignColumn guibg=#111b28
hi LineNr guifg=#2f425b ctermfg=237
hi TabLineFill guibg=#111b27 guifg=#111b27
hi TabLine guibg=#323c4d guifg=#9aa7bd
hi Title guifg=#cc7676 
hi Visual guibg=#51617d guifg=#5fd7ff  gui=none
hi FoldColumn guibg=#111b27 guifg=#223247
hi Folded guibg=#cc7676
hi DiffDelete guibg=#111b28 guifg=#303030 
hi StatusLine guibg=#2f425b  guifg=#111b28
hi WildMenu guifg=white guibg=#cc7676

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#c13636 ctermfg=1

"======SYNTAX======="
" Symbol, hash key
hi Constant guifg=#91a7ff
hi Special guifg=#91a7ff 
hi Conditional guifg=#cc7676
hi Identifier guifg=#a8a5d1
hi Type guifg=#7bffa0
hi NonText guifg=#46556d 
hi Comment guifg=#a8a5d1

hi rubyDefine guifg=#cc7676
hi rubyClass guifg=#cc7676
hi rubyModule guifg=#cc7676
hi rubyControl guifg=#cc7676
hi rubyAttribute guifg=#a8a5d1
hi rubyException guifg=#f44242
hi Search guibg=#c13636 guifg=white
hi CursorLine guibg=#232a36

hi jsonKeyword guifg=#7bffa0
hi NERDTreeCWD guifg=#cc7676

let g:terminal_color_4 = '#65b2ff'
let g:terminal_color_3 = '#ffb378'
let g:terminal_color_14 = '#00b6ff'
