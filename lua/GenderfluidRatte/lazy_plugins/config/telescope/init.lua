local telescope = {}

function telescope.setup()
    require("telescope").setup({
        defaults = {
            disable_devicons = false
        }
    })
end

function telescope.keymap()
    local builtin = require("telescope.builtin") 
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>gf", builtin.git_files)
end

return telescope
