let g:toggle_list_no_mappings=1
set laststatus=2
set clipboard=unnamed
set nocompatible              " be iMproved, required
filetype off                  " required

" PLUGINS
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'milkypostman/vim-togglelist'
Plugin 'mhartington/oceanic-next'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set noshowmode
set background=dark

colorscheme one-dark
let g:airline_theme='deep_space_one'

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:deepspace_italics = 1 " Enable terminal italics
let g:NERDTreeHijackNetrw=1
let NERDTreeMapOpenExpl=''
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
" Leader
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
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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
nnoremap <leader>i :AsyncGrep "<C-R><C-W>"<CR>
nnoremap F :AsyncGrep<space>

let g:asyncrun_trim = 1
command! -nargs=1 AsyncGrep
      \ call setqflist([])
      \ | execute 'AsyncRun! ag ' . <q-args>
      \ | execute 'redraw'
      \ | execute 'copen'

" ignore .git files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Numbers
set number
set numberwidth=5

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Netrw explore
command! E :Explore

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
nnoremap <leader>e <C-w>k
nnoremap <leader>y <C-w>h
nnoremap <leader>o <C-w>l

" Quicklish shortcuts
nnoremap <C-e> :cp<CR>zvzz
nnoremap <C-n> :cn<CR>zvzz
nmap <script> <silent> <C-k> :call ToggleLocationList()<CR>
nmap <script> <silent> <C-y> :call ToggleQuickfixList()<CR><Paste>

" Convenience
:nmap ; :
nnoremap Q :q<cr>
nnoremap X :x<cr>

map <C-i> :NERDTreeToggle<CR>
map <C-l> :SyntasticCheck<CR>

"Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" ===== Seeing Is Believing =====

" Annotate every line
  nmap <leader>bb :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR><Esc><Esc>;
" Annotate marked lines
  nmap <leader>bn :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
" Remove annotations
  nmap <leader>bo :%.!seeing_is_believing --clean<CR>;
" Mark the current line for annotation
  nmap <leader>be A # => <Esc>
" Mark the highlighted lines for annotation
  vmap <leader>be :norm A # => <Esc>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Workman Layout
nnoremap l o
nnoremap o l
nnoremap L O
vnoremap l o
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
nnoremap K E
nnoremap E K
nnoremap gk ge
nnoremap ge gk
nnoremap y h
onoremap h y
nnoremap h y
vnoremap h y
vnoremap y h
nnoremap H Y
nnoremap Y H

nnoremap t :
let g:fugitive_no_maps = 1
let g:surround_no_mappings = 1

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
