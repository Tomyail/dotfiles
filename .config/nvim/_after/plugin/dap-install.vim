lua <<EOF

local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "jsnode/"
local fn = vim.fn

dap_install.config('jsnode',{

adapters = {
		type = "executable",
		command = "node",
		args = { dbg_path .. "vscode-node-debug2/out/src/nodeDebug.js" },
	},
	configurations = {
		{
			type = "node2",
			request = "launch",
			program = "${file}",
			cwd = fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
		},
		{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = 'Attach to process',
		type = 'node2',
		request = 'attach',
		processId = require'dap.utils'.pick_process,
	  },
	},
})
-- can not using default because jsnode config paogram  include workspace with not works
-- for _, debugger in ipairs(dbg_list) do
--	dap_install.config(debugger)
--end

EOF
