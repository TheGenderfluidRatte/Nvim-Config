return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'neovim/nvim-lspconfig',

        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        'petertriho/cmp-git',
    },

    config = function() 
        require("GenderfluidRatte.lazy_plugins.config.cmp").config()
    end
}
