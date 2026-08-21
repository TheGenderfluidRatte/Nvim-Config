return {
    "lewis6991/gitsigns.nvim",

    config = function()
        require("gitsigns").setup()
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            callback = function()
                require("gitsigns").refresh()
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "GitSignsUpdate",
            callback = function()
                vim.cmd("redrawstatus")
            end,
        })
    end
}
