local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (os.rename(lazypath, lazypath) and true or false) then
    print("Cloning folke/lazy.nvim...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

local config = { ui = { border = "single" } }
local plugins = {
    require("hiegz.plugins.cmp"),
    require("hiegz.plugins.luasnip"),
    require("hiegz.plugins.conform"),
    require("hiegz.plugins.lspconfig"),
    require("hiegz.plugins.nvim-jdtls"),
    require("hiegz.plugins.telescope"),
    require("hiegz.plugins.vimtex"),
    require("hiegz.plugins.cord"),
    require("hiegz.plugins.everforest"),
}

vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, config)
