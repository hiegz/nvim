local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["cssls"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
    settings = require("byut.languages.css.settings"),
})

conform.formatters_by_ft.css = { "prettierd", "prettier" }
