local M = {}

function M.on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false

    --

    local opts = { silent = true, noremap = true, buffer = bufnr }
    local keymap = vim.keymap.set

    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gI", vim.lsp.buf.implementation, opts)
    keymap("n", "gl", vim.diagnostic.open_float, opts)

    -- stylua: ignore start
    keymap("n", "<leader>lj", function() vim.diagnostic.jump({ count =  1 }) end, opts)
    keymap("n", "<leader>lk", function() vim.diagnostic.jump({ count = -1 }) end, opts)
    -- stylua: ignore end

    keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
    keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)

    keymap("n", "<leader>qd", vim.diagnostic.setqflist, opts)
end

function M.capabilities()
    local c = require("cmp_nvim_lsp").default_capabilities()
    c.offsetEncoding = { "utf-16" }
    return c
end

return M
