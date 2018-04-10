let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

 " When writing a buffer (no delay).
 call neomake#configure#automake('w')
 " When writing a buffer (no delay), and on normal mode changes (after750ms).
 call neomake#configure#automake('nw', 750)
 " When reading a buffer (after 1s), and when writing (no delay).
 call neomake#configure#automake('rw', 1000)
 " Full config: when writing or reading a buffer, and on changes in insert and
 " normal mode (after 1s; no delay when writing).
 call neomake#configure#automake('nrwi', 500)
let g:deoplete#disable_auto_complete = 1
"inoremap <expr> <Tab>  deoplete#mappings#manual_complete()

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
let g:netrw_liststyle = 3
let g:netrw_banner = 0
map <C-i> :NERDTreeToggle<CR>
command! E :Explore

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

" NO MAPPINGS
let g:toggle_list_no_mappings=1
let g:fugitive_no_maps = 1
let g:surround_no_mappings = 1

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
nmap <script> <silent> <C-y> :call ToggleQuickfixList()<CR>

" Convenience
:nmap ; :
nnoremap Q :q<cr>
nnoremap X :x<cr>

nmap <C-l> ]mzz
nmap <C-k> [mzz

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
nnoremap T :tabnew<CR>

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
