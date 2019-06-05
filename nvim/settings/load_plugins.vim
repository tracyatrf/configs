set rtp+=~/.config/nvim/bundle/Vundle.vim
set runtimepath^=~/.config/nvim/bundle/*

let vundle_path='~/.config/nvim/bundle'
call vundle#begin(vundle_path)

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

Plugin 'neomake/neomake'
Plugin 'Shougo/deoplete.nvim'
Plugin 'fishbullet/deoplete-ruby'
Plugin 'hwartig/vim-seeing-is-believing'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
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
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
