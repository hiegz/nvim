local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["zls"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
})

-- this one has to be installed manually
conform.formatters_by_ft.zig = { "zigfmt" }
