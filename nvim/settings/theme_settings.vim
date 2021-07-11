set noshowmode
set background=dark
colorscheme deep-space-one
"colorscheme nord
let g:airline_theme='deep_space_one'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:deepspace_italics = 1 " Enable terminal italics

" dark red
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75
hi tsxTag guifg=#E06C75
hi tsxCloseTag guifg=#E06C75
hi notesCodeStart guifg=#E06C75
hi notesCodeEnd guifg=#E06C75

" orange
"
hi tsxTagName guifg=#F99575
hi tsxCloseString guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey

hi tsxTypes guifg=#666666
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
