local terminal = {}

function terminal.setup()
    -- Escape out of the Terminal
	vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
end

return terminal
