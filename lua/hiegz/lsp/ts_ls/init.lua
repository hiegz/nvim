vim.lsp.config("ts_ls", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.lsp.ts_ls.settings"),
})

vim.lsp.enable("ts_ls")
