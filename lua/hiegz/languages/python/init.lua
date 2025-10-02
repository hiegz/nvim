local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["pyright"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.languages.python.settings")
})

conform.formatters_by_ft.python = { "black" }
