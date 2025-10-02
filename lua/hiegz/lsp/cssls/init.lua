vim.lsp.config("cssls", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.lsp.cssls.settings"),
})

vim.lsp.enable("cssls")
