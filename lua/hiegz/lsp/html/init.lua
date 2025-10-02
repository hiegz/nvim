vim.lsp.config("html", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

vim.lsp.enable("html")

-- Treat Handlebars files as HTML
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.hbs", "*.handlebars" },
    callback = function()
        vim.bo.filetype = "html"
    end,
})
