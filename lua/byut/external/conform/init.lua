return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                asm = { "asmfmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                -- cmake = { "cmake_format" },
                haskell = { "fourmolu", "ormolu" },
                markdown = { "mdformat", "prettierd", "prettier" },
                javascript = { "prettierd", "prettier" },
                typescript = { "prettierd", "prettier" },
                jsonc = { "prettierd", "prettier" },
                json = { "prettierd", "prettier" },
                toml = { "prettierd", "prettier" },
                yaml = { "yamlfmt" },
                python = { "black" },
                rust = { "rustfmt" },
                go = { "gofmt" },
                sh = { "shfmt" },
                lua = { "stylua" },
                ["_"] = { "trim_whitespace" },
            },
        })
    end,
}
