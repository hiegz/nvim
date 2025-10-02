--
-- options.lua
--
-- For an overview of options see ':help option-list'
-- or ':help option-summary'
--

vim.opt.exrc = true

vim.opt.belloff = "all"

-- vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.syntax = "on"

vim.opt.spell = false
vim.opt.spelllang = "en,de"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.autochdir = false
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.autowriteall = false

vim.opt.mouse = "a"
vim.opt.mousehide = true
vim.opt.mousescroll = "ver:3,hor:6"

vim.opt.guicursor = ""
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.numberwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdwinheight = 10
vim.opt.cmdheight = 1

vim.opt.scrolloff = 1000
vim.opt.sidescrolloff = 20

vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.breakindent = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- use the default internal neovim formatter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.bo.formatprg = ""
        vim.bo.formatexpr = ""
    end,
})
