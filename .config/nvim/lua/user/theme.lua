-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[highlight Normal guibg=none]]

vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
