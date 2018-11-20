"put python host in ./local.vim
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'

runtime local.vim

set laststatus=2
set clipboard=unnamed
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set termguicolors
" PLUGINS
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
let vundle_path='~/.config/nvim/bundle'
call vundle#begin(vundle_path)

Plugin 'vim-ruby/vim-ruby'
Plugin 'elzr/vim-json'
Plugin 'neomake/neomake'
Plugin 'Shougo/deoplete.nvim'
Plugin 'fishbullet/deoplete-ruby'
Plugin 'rakr/vim-one'
Plugin 'tpope/vim-endwise'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'milkypostman/vim-togglelist'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mkitt/tabline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

"set signcolumn=yes

augroup NERDy
  autocmd!
  autocmd FileType tagbar,nerdtree setlocal signcolumn=no
  autocmd VimEnter * if !argc() | NERDTree | endif
  "autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
augroup END

"normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrw', 250)
" run neomake manually
nmap <space>l :Neomake<CR>

let g:deoplete#disable_auto_complete = 1
let g:vim_json_syntax_conceal = 0
let g:ruby_indent_block_style = 'do'

" GENERAL
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
let mapleader = " "
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set colorcolumn=80
set nowrap
highlight ColorColumn guibg=#102330

let g:gitgutter_override_sign_column_highlight = 1

" THEME
set noshowmode
set background=dark
colorscheme deep-space-one
"colorscheme one
let g:airline_theme='deep_space_one'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" NERD
let g:deepspace_italics = 1 " Enable terminal italics
let g:NERDTreeHijackNetrw=0
let NERDTreeMapOpenExpl=''
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen=0
let NERDTreeStatusline="NERD"
let g:netrw_liststyle = 3
let g:netrw_banner = 0
nmap <tab> :NERDTreeToggle<CR>
nmap <leader><tab> :NERDTreeFind<CR>
nmap <leader>qq :qa!<CR>

" NO MAPPINGS
let g:toggle_list_no_mappings=1
let g:fugitive_no_maps = 1
let g:surround_no_mappings = 1

" FUGITIVE
nnoremap gd :Gdiff<CR>
nnoremap gs :Gstatus<CR>
nnoremap du :diffupdate<CR>
nnoremap gc :Gcommit<CR>

augroup redrawResize
  autocmd VimResized * redraw!
augroup END

augroup setJS
  autocmd!
  autocmd BufNewFile,BufRead *.json set ft=json
augroup END

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.spec set filetype=ruby
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" immediate escape
set timeoutlen=1000 ttimeoutlen=0

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden --ignore .git -g "" %s'
  let g:ctrlp_use_caching = 0
endif

"nnoremap <leader>i :AsyncGrep "<C-R><C-W>"<CR>
nnoremap \ :AsyncGrep<space>
nnoremap <leader>f :noh<CR>
nnoremap <leader>p "0p
nnoremap <S-Tab> :CtrlPBuffer<CR>
nnoremap <leader>i :CtrlPTag<CR>

let g:asyncrun_trim = 1
command! -nargs=1 AsyncGrep
      \ call setqflist([])
      \ | execute 'AsyncRun! ag ' . <q-args>
      \ | execute 'redraw'
      \ | execute 'copen'

" ignore .git files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Json
command! Json execute '%!python -m json.tool'
command! JSON execute '%!python -m json.tool' | execute 'If' | set ft=JSON

function! ConvertFails()
  :let @f='^dt.^hss"i- :filepath: l:result: FAILn'
  exec "normal! gg".line('$')."@f"
  normal! ggO---
endfunction
command! Fails call ConvertFails()


" Numbers
set number
set numberwidth=4

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Netrw explore

" Remove Whitespace
command! Ws :%s/\s\+$//e

" Reindent File
command! If exec "normal gg=G"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <leader>n <C-w>j
nnoremap <leader>N <C-w><S-j>
nnoremap <leader>e <C-w>k
nnoremap <leader>E <C-w><S-k>
nnoremap <leader>y <C-w>h
nnoremap <leader>Y <C-w><S-h>
nnoremap <leader>o <C-w>l
nnoremap <leader>O <C-w><S-l>

nnoremap <leader>w <C-w>
nnoremap <leader>t <C-w>s
nnoremap <leader>g <C-w>v
nnoremap <leader>sy <C-w>10<
nnoremap <leader>so <C-w>10>

nnoremap <leader>sn <C-w>5+
nnoremap <leader>se <C-w>5-

" Quicklish shortcuts
nnoremap <C-e> :cp<CR>zvzz
nnoremap <C-n> :cn<CR>zvzz

nmap <script> <silent> <C-k> :call ToggleLocationList()<CR>
nmap <script> <silent> <C-y> :call ToggleQuickfixList()<CR>

" Convenience
nnoremap Q :q<cr>
command! Q exec 'q'
nnoremap X :x<cr>
nnoremap # :<C-U>exec v:count<CR>
nmap <C-l> ]mzz
nmap <C-space> [mzz
nnoremap S :w<CR>
nnoremap T :tabnew<CR>
nnoremap tt <C-]>zz^
nnoremap <C-t> <C-t>zz
nnoremap th gt
nnoremap gt gT

" Vim RSpec
let g:rspec_runner = "os_x_iterm2"
map <Leader>sc :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" ===== Seeing Is Believing =====
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

" Workman Layout
nnoremap l o
nnoremap o l
nnoremap L O
vnoremap l o
vnoremap o l
vnoremap s l
nnoremap O L
nnoremap j n
nnoremap n j
vnoremap n j
vnoremap j n
nnoremap J N
nnoremap N J
nnoremap gn gj
nnoremap gj gn
nnoremap k e
nnoremap e k
vnoremap k e
vnoremap e k
onoremap k e
onoremap K E
nnoremap K E
nnoremap E K
vnoremap K E
nnoremap gk ge
nnoremap ge gk
nnoremap y h
onoremap h y
nnoremap h y
vnoremap h y
vnoremap y h
nnoremap H Y
nnoremap Y H

" Surround.vim remaps
nmap ds <Plug>Dsurround
nmap cs <Plug>Csurround
nmap hs <Plug>Ysurround
nmap hS <Plug>YSurround
nmap hss <Plug>Yssurround
nmap hSs <Plug>YSsurround
nmap hSS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround

" open and source vimrc
command! Vo :tabe $MYVIMRC
command! Vs :so $MYVIMRC | :AirlineRefresh

augroup suffixes
    autocmd!

    let associations = [
                \["javascript", ".js,.javascript,.es,.esx,.json"],
                \["ruby", ".rb,.erb"]
                \]

    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
augroup END

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
