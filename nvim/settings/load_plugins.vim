set rtp+=~/.config/nvim/bundle/Vundle.vim
set runtimepath^=~/.config/nvim/bundle/*

let vundle_path='~/.config/nvim/bundle'
call vundle#begin(vundle_path)

Plugin 'VundleVim/Vundle.vim'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'BurntSushi/ripgrep'

Plugin 'mhartington/oceanic-next'
Plugin 'ludovicchabant/vim-gutentags'

Plugin 'vim-ruby/vim-ruby'
Plugin 'kana/vim-textobj-user'
Plugin 'rhysd/vim-textobj-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'elixir-editors/vim-elixir'
Plugin 'udalov/kotlin-vim'

Plugin 'neomake/neomake'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'Shougo/deoplete.nvim'
Plugin 'etordera/deoplete-ruby'
Plugin 'hwartig/vim-seeing-is-believing'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'vim-airline/vim-airline'
Plugin 'skywind3000/asyncrun.vim'

Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-endwise'
Plugin 'milkypostman/vim-togglelist'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mkitt/tabline.vim'

Plugin 'hashivim/vim-terraform'

Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

"Plugin 'MaxMEllon/vim-jsx-pretty'
"Plugin 'arcticicestudio/nord-vim'
Plugin 'nvim-telescope/telescope.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
