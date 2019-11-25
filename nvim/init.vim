"put python host in ./local.vim
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'

runtime local.vim
runtime settings/workman_layout.vim

set nocompatible              " be iMproved, required
filetype off                  " required

runtime macros/matchit.vim
runtime settings/load_plugins.vim

filetype plugin indent on
syntax on

" General Configurations
runtime settings/general_settings.vim
runtime settings/theme_settings.vim

runtime settings/file_type_settings.vim
runtime settings/search_settings.vim
runtime settings/window_settings.vim
runtime settings/convenience_mappings.vim

" Plugin Configurations
runtime settings/plugins/gitgutter_settings.vim
runtime settings/plugins/deoplete_settings.vim
runtime settings/plugins/terraform_settings.vim
runtime settings/plugins/nerdtree_settings.vim
runtime settings/plugins/neomake_settings.vim
runtime settings/plugins/vim_json_settings.vim
runtime settings/plugins/fugitive_settings.vim
runtime settings/plugins/togglelist_settings.vim
runtime settings/plugins/seeing_is_believing_settings.vim
runtime settings/plugins/surround_vim_settings.vim
runtime settings/plugins/vim_rspec_settings.vim
