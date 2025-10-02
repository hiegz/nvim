vim.lsp.config("tailwindcss", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

vim.lsp.enable("tailwindcss")
