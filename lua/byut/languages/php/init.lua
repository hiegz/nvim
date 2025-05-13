local lspconfig = require("lspconfig")
local conform = require("conform")

lspconfig["intelephense"].setup({
    on_attach = require("byut.defaults.lsp").on_attach,
    capabilities = require("byut.defaults.lsp").capabilities(),
    root_dir = function(pattern)
        _ = pattern
        return vim.uv.cwd()
    end,
})

conform.formatters_by_ft.php = { "php-cs-fixer" }
