return {
    Lua = {
        runtime = {
            pathStrict = true,
        },
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
            },
        },
    },
}
