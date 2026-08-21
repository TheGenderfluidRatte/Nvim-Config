return {
    "rebelot/heirline.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "lewis6991/gitsigns.nvim"
    },

    event = "VeryLazy",

    config = function()
        require("heirline").setup(require("GenderfluidRatte.lazy_plugins.config.heirline").setup())
    end
}
