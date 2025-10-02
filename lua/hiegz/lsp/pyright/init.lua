vim.lsp.config("pyright", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.lsp.pyright.settings"),
})

vim.lsp.enable("pyright")
