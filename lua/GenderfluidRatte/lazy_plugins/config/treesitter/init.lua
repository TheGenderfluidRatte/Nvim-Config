local treesitter = {}

treesitter.parsers = {
    "c",
    "cpp",
    "glsl",
    "json",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    "vimdoc"
}

function treesitter.setup()
    -- Load treesitter when opening file
    vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
        callback = function()
            if vim.bo.buftype ~= "" then
                return
            end

            pcall(vim.treesitter.start, 0)
        end
    })

    -- Install parsers
    vim.api.nvim_create_autocmd( "User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
            require("nvim-treesitter").install(treesitter.parsers)
        end
    })
end

return treesitter
