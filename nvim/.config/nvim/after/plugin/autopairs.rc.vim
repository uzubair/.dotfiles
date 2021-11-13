" Plug: jiangmiao/auto-pairs
" Insert or delete brackets, parens, and quotes in pair
" let g:AutoPairsFlyMode=0
" let g:AutoPairsShortcutBackInsert = '<M-b>'
lua << EOF
  local status, autopairs = pcall(require, "nvim-autopairs")
  if (not status) then return end

  autopairs.setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
  })
EOF
