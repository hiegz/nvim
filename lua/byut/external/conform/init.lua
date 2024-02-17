return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                ["_"] = { "trim_whitespace" },
            },
        })
    end,
}
