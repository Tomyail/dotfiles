-- vim.cmd[[colorscheme gruvbox]]

vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
 vim.cmd[[highlight Normal guibg=none]]
