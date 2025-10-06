vim.lsp.config("tinymist", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.lsp.tinymist.settings"),
})

vim.lsp.enable("tinymist")
