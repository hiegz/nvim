return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                ["_"] = { "trim_whitespace" },
            },
        })

        conform.formatters_by_ft.sh = { "shfmt" }
        conform.formatters_by_ft.c = { "clang-format" }
        conform.formatters_by_ft.cpp = { "clang-format" }
        conform.formatters_by_ft.css = { "prettierd", "prettier" }
        conform.formatters_by_ft.html = { "prettierd", "prettier" }
        conform.formatters_by_ft.java = { lsp_format = "fallback" }
        conform.formatters_by_ft.javascript = { "prettierd", "prettier" }
        conform.formatters_by_ft.typescript = { "prettierd", "prettier" }
        conform.formatters_by_ft.javascriptreact = { "prettierd", "prettier" }
        conform.formatters_by_ft.typescriptreact = { "prettierd", "prettier" }
        conform.formatters_by_ft.lua = { "stylua" }
        conform.formatters_by_ft.php = { "php_cs_fixer" }
        conform.formatters_by_ft.python = { "black" }
        conform.formatters_by_ft.rust = { "rustfmt" }
        conform.formatters_by_ft.zig = { "zigfmt" }

        local opts = { silent = true, noremap = true }
        local keymap = vim.keymap.set

        -- Format code
        keymap("n", "<leader>af", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, opts)
    end,
}
