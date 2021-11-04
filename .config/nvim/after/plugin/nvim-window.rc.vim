map <silent> <leader>ww :lua require('nvim-window').pick()<CR>


lua <<EOF

require('nvim-window').setup({
  -- The characters available for hinting windows.
  chars = {
    'a','s','d','f',
    'q','w','e','r'
  },

  -- A group to use for overwriting the Normal highlight group in the floating
  -- window. This can be used to change the background color.
  normal_hl = 'Normal',

  -- The highlight group to apply to the line that contains the hint characters.
  -- This is used to make them stand out more.
  hint_hl = 'Bold',

  -- The border style to use for the floating window.
  border = 'single'
})


EOF
