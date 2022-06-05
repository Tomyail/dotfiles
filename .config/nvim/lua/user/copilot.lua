
vim.g.copilot_filetypes = {
  ["*"] = false,
  javascript = true
}

vim.cmd [[
  imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]]
