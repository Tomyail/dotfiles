local M = {}

local g = vim.g

M.init = function()
  g.im_select_default = "com.apple.keylayout.ABC" -- The default value on macOS
  g.im_select_get_im_cmd = "im-select"
end

return M
