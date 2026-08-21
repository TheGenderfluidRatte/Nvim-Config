local colorscheme = {}

function colorscheme.setup()
    require("kanagawa").setup({
        theme = "dragon",
        background = {
            dark = "dragon",
            light = "lotus"
        },
    })

    vim.cmd("colorscheme kanagawa")
end

return colorscheme
