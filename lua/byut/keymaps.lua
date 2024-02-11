--
-- keymaps.lua
--
--

local opts = { silent = true, noremap = true }
local keymap = vim.keymap.set

vim.g.timeoutlen = 500
vim.g.mapleader = " "

keymap("n", "<leader>eo", ":Explore<CR>", opts)

keymap("n", "<leader>qo", ":bot copen<CR>", opts)
keymap("n", "<leader>qc", ":ccl<CR>", opts)

keymap("n", "<leader>qn", ":cnext<CR>", opts)
keymap("n", "<leader>qN", ":cprev<CR>", opts)
keymap("n", "<leader>qp", ":cprev<CR>", opts)

keymap("n", "<leader>wv", ":vsplit<CR>", opts)
keymap("n", "<leader>wh", ":split<CR>", opts)
keymap("n", "<leader>wt", ":tab split<CR>", opts)

-- Navigate through open tabs
keymap("n", "<S-h>", ":tabprev<CR>", opts)
keymap("n", "<S-l>", ":tabnext<CR>", opts)

-- Pend the lines below to the current line
-- and keep the cursor in the same place
keymap("n", "J", "mzJ`z", opts)

-- Jump to the previous buffer
keymap("n", "<C-o>", "<C-^>", opts)

-- Stop the highlighting for the `hlsearch` option
keymap("n", "<C-r>", ":nohlsearch<CR>", opts)

-- Move selected lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Search for pattern in the current working directory
keymap("n", "<leader>qe", function()
    local expr = vim.fn.input("Search pattern: ")
    if #expr > 0 then
        local status, _ = pcall(
            vim.api.nvim_cmd,
            vim.api.nvim_parse_cmd(expr.format("vimgrep /%s/j **/*", expr), {}),
            { output = true }
        )
        if status then
            vim.cmd([[bot copen]])
        end
    end
end, opts)
