local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["lua_ls"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
    settings = require("byut.languages.lua.settings"),
})

conform.formatters_by_ft.lua = { "stylua" }
