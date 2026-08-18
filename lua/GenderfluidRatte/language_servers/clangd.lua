vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--target=x86_64-w64-mingw32",
        "--query-driver=g++.exe",
    },

    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

    root_markers = { "premake5.lua", ".git", ".clangd", "compile_commands.json" },
})

vim.lsp.enable("clangd")
