local ex = {}

function ex.setup()
    vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)
end

return ex
