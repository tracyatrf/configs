augroup Tscope
  autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

augroup END

lua << EOF

local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { '/tags' },
    mappings = {
      i = {
        ["<C-s>"] = actions.file_split;
      }
    }
  }
}
EOF
