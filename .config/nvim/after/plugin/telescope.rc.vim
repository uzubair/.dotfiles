if !exists('g:loaded_telescope')
    finish
endif

lua << EOF
--vim.lsp.set_log_level("debug")
EOF

" TODO: require('telescope.actions')
" ["<C-q>"] = actions.send_to_qflist,
lua << EOF
require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qfist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
      }
    }
  },
  extensions = {
      fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
      }
  },
}
EOF

nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fr :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fp :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >") })<cr>
nnoremap <leader>fb :lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fu :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :ua require('telescope.builtin').help_tags()<cr>

" nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

lua << EOF
require('telescope').load_extension('fzy_native')
EOF
