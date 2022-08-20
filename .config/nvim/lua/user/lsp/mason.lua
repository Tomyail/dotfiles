local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok2, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok2 then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})

local servers = {
	"cssls",
	"cssmodules_ls",
	-- "emmet_ls",
	"html",
	-- "jdtls",
	"jsonls",
	"sumneko_lua",
	"tflint",
	"tsserver",
	"pyright",
	"yamlls",
	-- "bashls",
	"clangd",
	"eslint",
	-- "volar", -- for vue 3
	"vuels", -- for vue 2
	"elixirls",
}

mason_lsp.setup({
	ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end
mason_lsp.setup_handlers({
	function(server) -- default handler (optional)
		local opts = {}
		opts = {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
		}

		local ok, cfg = pcall(require, "user.lsp.settings." .. server)
		if not ok then
			cfg = nil
		end
		if cfg then
			opts = vim.tbl_deep_extend("force", cfg, opts)
		end

		lspconfig[server].setup(opts)
	end,
})
