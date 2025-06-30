local lspconfig = require("lspconfig")

lspconfig["cssls"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
    settings = require("byut.languages.css.settings"),
})
