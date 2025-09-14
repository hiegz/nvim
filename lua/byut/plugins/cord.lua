return {
    "vyfor/cord.nvim",
    build = ":Cord update",
    config = function()
        require("cord").setup({
            editor = { client = "neovim" },
            display = { view = "asset" },
            plugins = { "cord.plugins.persistent_timer" },
        })
    end,
}
