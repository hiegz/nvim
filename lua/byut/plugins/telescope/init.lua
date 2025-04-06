return {
    "nvim-telescope/telescope.nvim",
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                prompt_prefix = "> ",
                selection_caret = "> ",
                layout_strategy = "horizontal",
                sorting_strategy = "ascending",
                selection_strategy = "closest",
                path_display = { "truncate" },
                borderchars = {
                    "─",
                    "│",
                    "─",
                    "│",
                    "┌",
                    "┐",
                    "┘",
                    "└",
                },
                layout_config = { horizontal = { prompt_position = "top" } },
                initial_mode = "insert",
            },
            pickers = {
                find_files = {
                    previewer = false,
                    respect_gitignore = true,
                    disable_devicons = true,
                    hidden = false,
                },
            },
        })

        local opts = { silent = true, noremap = true }
        local keymap = vim.keymap.set
        keymap("n", "<space>ff", builtin.find_files, opts)
        keymap("n", "<space>fd", builtin.lsp_document_symbols, opts)
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
