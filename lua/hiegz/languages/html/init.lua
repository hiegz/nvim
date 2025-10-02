local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["html"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

lspconfig["tailwindcss"].setup({
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

conform.formatters_by_ft.html = { "prettierd", "prettier" }

-- Treat Handlebars files as HTML
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.hbs", "*.handlebars" },
    callback = function()
        vim.bo.filetype = "html"
    end,
})
