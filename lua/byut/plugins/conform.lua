return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({})

        local opts = { silent = true, noremap = true }
        local keymap = vim.keymap.set

        -- Format code
        keymap("n", "<leader>af", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, opts)
    end,
}
