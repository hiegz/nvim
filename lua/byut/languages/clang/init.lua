local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["clangd"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
})

conform.formatters_by_ft.c = { "clang-format" }
conform.formatters_by_ft.cpp = { "clang-format" }
