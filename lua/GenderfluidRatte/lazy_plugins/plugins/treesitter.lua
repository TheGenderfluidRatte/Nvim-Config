return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',

    init = require("GenderfluidRatte.lazy_plugins.config.treesitter_config").setup()
}
