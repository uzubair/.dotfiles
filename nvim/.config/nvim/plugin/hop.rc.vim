if !exists('hop')
    finish
endif

lua << EOF
--vim.lsp.set_log_level("debug")
EOF

lua << EOF
    require'hope'.setup()

    vim.api.nvim_set_keymap('n', '<space>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
    vim.api.nvim_set_keymap('n', '<space>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
    vim.api.nvim_set_keymap('n', '<space>hc1', "<cmd>lua require'hop'.hint_char1()<cr>", {})
    vim.api.nvim_set_keymap('n', '<space>hc2', "<cmd>lua require'hop'.hint_char2()<cr>", {})
EOF
