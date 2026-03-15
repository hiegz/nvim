return {
    "vyfor/cord.nvim",
    build = ":Cord update",
    config = function()
        require("cord").setup({
            editor = { client = "neovim" },
            display = { view = "asset" },
            idle = { enabled = false },
            extensions = {
                persistent_timer = {
                    scope = "workspace",
                    mode = "all",
                    file = vim.fn.stdpath "data" .. "/cord/extensions/persistent_timer/data.json",
                    save_on = { "exit", "focus_change", "periodic" },
                    save_interval = 30,
                },
            },
        })
    end,
}
