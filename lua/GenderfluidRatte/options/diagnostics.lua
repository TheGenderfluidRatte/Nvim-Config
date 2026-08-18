local diagnostics = {}

function diagnostics.setup()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
    })
end

return diagnostics
