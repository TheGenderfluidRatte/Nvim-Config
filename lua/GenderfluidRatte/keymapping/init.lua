local keymapping = {}

function keymapping.setup()
	vim.g.mapleader = " "

	require("GenderfluidRatte.keymapping.explorer").setup()
	require("GenderfluidRatte.keymapping.terminal").setup()
end

return keymapping
