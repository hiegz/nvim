vim.lsp.config("bashls", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

vim.lsp.enable("bashls")
