local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["ts_ls"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
    settings = require("byut.languages.javascript.settings"),
})

conform.formatters_by_ft.javascript = { "prettierd", "prettier" }
conform.formatters_by_ft.typescript = { "prettierd", "prettier" }
conform.formatters_by_ft.javascriptreact = { "prettierd", "prettier" }
conform.formatters_by_ft.typescriptreact = { "prettierd", "prettier" }
