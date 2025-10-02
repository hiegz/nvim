local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["clangd"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

conform.formatters_by_ft.c = { "clang-format" }
conform.formatters_by_ft.cpp = { "clang-format" }
