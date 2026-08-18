local options = {}

function options.setup()
	require("GenderfluidRatte.options.tabs").setup()
	require("genderfluidratte.options.numbers").setup()
	require("genderfluidratte.options.diagnostics").setup()
end

return options
