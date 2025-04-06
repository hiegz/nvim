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

    keymap("n", "<leader>lj", vim.diagnostic.goto_next, opts)
    keymap("n", "<leader>lk", vim.diagnostic.goto_prev, opts)
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
