local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["pyright"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
    settings = require("byut.languages.python.settings")
})

conform.formatters_by_ft.python = { "black" }
