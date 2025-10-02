vim.lsp.config("intelephense", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    root_dir = function(pattern)
        _ = pattern
        return vim.uv.cwd()
    end,
})

vim.lsp.enable("intelephense")
