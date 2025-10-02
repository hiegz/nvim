local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["lua_ls"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.languages.lua.settings"),
})

conform.formatters_by_ft.lua = { "stylua" }
