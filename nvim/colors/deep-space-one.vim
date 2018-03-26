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
hi Normal guifg=white ctermfg=white guibg=#172333 ctermbg=black gui=NONE 
hi VertSplit guibg=#111b28  guifg=#111b28 ctermbg=white ctermfg=black
hi EndOfBuffer guifg=#111b28 guibg=#111b28 ctermfg=black ctermbg=000
hi LineNr guifg=#223247 ctermfg=237

if &termguicolors == 1 
"======SYNTAX======="
" Symbol, hash key
hi Constant guifg=#6c7fc9
" quotes
hi Special guifg=#6c7fc9 
hi Conditional guifg=#cc7676
" inside block var
"hi Identifier guifg=#5c6e6d
hi Identifier guifg=#a8a5d1
hi Type guifg=#7bffa0
hi rubyControl guifg=#cc7676
hi NERDTreeCWD guifg=#cc7676

hi Comment guifg=#a8a5d1
endif
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
