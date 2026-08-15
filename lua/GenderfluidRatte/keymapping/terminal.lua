local terminal = {}

function terminal.setup()
	-- Vertical Terminal
	vim.keymap.set("n", "<leader>tr", function()
		vim.cmd("vert term")
		vim.cmd("startinsert")
	end)

	-- Escape out of the Terminal
	vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
end

return terminal
