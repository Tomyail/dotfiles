-- https://github.com/vuejs/vetur/blob/7309c81dcee48e0f9ca36c7b12c7f5feb659dfa5/server/src/config.ts
return {
	config = {
		css = {},
		emmet = {},
		html = {
			suggest = {},
		},
		javascript = {
			format = {},
		},
		stylusSupremacy = {},
		typescript = {
			format = {},
		},
		flags = {
			debounce_text_changes = 150,
		},
		vetur = {
			experimental = { templateInterpolationService = true },
			-- trace = {
			-- 	server = "verbose",
			-- },
			-- dev = {
			-- 	logLevel = "DEBUG",
			-- },
			completion = {
				autoImport = true,
				tagCasing = "kebab",
				useScaffoldSnippets = true,
			},
			format = {
				-- enable = true,
				-- defaultFormatter = {
				-- 	js = "prettier",
				-- 	ts = "prettier",
				-- },
				defaultFormatterOptions = {},
				scriptInitialIndent = false,
				styleInitialIndent = false,
			},
			useWorkspaceDependencies = false,
			validation = {
				script = true,
				style = true,
				template = true,
			},
		},
	},
}
