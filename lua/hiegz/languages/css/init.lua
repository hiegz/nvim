local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["cssls"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.languages.css.settings"),
})

conform.formatters_by_ft.css = { "prettierd", "prettier" }
