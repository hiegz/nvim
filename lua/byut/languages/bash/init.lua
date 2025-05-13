local lspconfig = require("lspconfig")

lspconfig["bashls"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
})
