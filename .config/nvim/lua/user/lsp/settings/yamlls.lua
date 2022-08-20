local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
	return {}
end

return {
	--[[ init_options = { ]]
	--[[   provideFormatter = false, ]]
	--[[ }, ]]
	settings = {
		yaml = {
			hover = true,
			completion = true,
			validate = true,
			schemas = schemastore.json.schemas(),
		},
	},
}
