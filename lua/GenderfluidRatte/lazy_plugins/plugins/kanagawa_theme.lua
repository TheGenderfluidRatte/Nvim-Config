return {
    "rebelot/kanagawa.nvim",

    lazy = false,
    priority = 100,

    config = function()
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("GenderfluidRatte.lazy_plugins.config.kanagawa_theme").setup()
            end
        })
    end
}
