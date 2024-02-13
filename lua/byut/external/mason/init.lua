return {
    "williamboman/mason.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("mason").setup({
            log_level = vim.log.levels.WARN,
            max_concurrent_installers = 4,
            ui = {
                border = "single",
                icons = {
                    package_installed = "[+]",
                    package_pending = "[/]",
                    package_uninstalled = "[-]",
                },
            },
        })
    end,
}
