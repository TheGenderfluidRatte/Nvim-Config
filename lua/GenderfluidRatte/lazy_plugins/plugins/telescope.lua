return {
    'nvim-telescope/telescope.nvim', 
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        local telescope = require("GenderfluidRatte.lazy_plugins.config.telescope")

        telescope.setup()
        telescope.keymap()
    end
}
