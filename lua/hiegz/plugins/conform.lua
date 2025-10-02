return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                ["_"] = { "trim_whitespace" },
            },
        })

        local opts = { silent = true, noremap = true }
        local keymap = vim.keymap.set

        -- Format code
        keymap("n", "<leader>af", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, opts)
    end,
}
