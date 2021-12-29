local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
lsp_signature.setup()
require "user.lsp.null-ls"
