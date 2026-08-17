local cmp = {}

cmp.plugin = require("cmp")

function cmp.config()
    cmp.plugin.setup({
        snippet = {
            expand = cmp.snippet_engine(args)
        },
        window = cmp.completion_window(),
        mapping = cmp.plugin.mapping.preset.insert(cmp.keymapping()),
        sources = cmp.plugin.sources(cmp.sources())
    })
    cmp.git_integration()
end

function cmp.snippet_engine(args)
    require('luasnip').lsp_expand(args.body)
end

function cmp.completion_window()
    return {
        completion = cmp.plugin.config.window.bordered(),
        documentation = cmp.plugin.config.window.bordered()
    }
end

function cmp.keymapping()
    return {
        ["<C-j>"] = cmp.plugin.mapping.select_next_item(),
        ["<C-k>"] = cmp.plugin.mapping.select_prev_item()
    }
end

function cmp.sources()
    return {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = "buffer" },
    }
end

function cmp.git_integration()
    cmp.plugin.setup.filetype("gitcommit", {
        sources = cmp.plugin.config.sources({
            { name = "git" }
        }, {
            { name = "buffer" }
        })
    })

    require("cmp_git").setup()
end

return cmp
