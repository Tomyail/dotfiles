-- vim.cmd[[colorscheme gruvbox]]

vim.cmd [[
try
  colorscheme tokyonight
		" colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
 vim.cmd[[highlight Normal guibg=none]]


local status_ok, colorizer= pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup()
