local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["zls"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

-- this one has to be installed manually
conform.formatters_by_ft.zig = { "zigfmt" }
