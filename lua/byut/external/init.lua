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
    require("byut.external.cmp"),
    require("byut.external.mason"),
    require("byut.external.conform"),
    require("byut.external.lspconfig"),
    require("byut.external.telescope"),
}

vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, config)
