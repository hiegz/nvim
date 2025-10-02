local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["bashls"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

conform.formatters_by_ft.sh = { "shfmt" }
