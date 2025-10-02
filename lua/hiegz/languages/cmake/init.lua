local lspconfig = require("lspconfig")

lspconfig["cmake"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})
