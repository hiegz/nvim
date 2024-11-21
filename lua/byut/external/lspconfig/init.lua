return {
    "neovim/nvim-lspconfig",
    config = function()
        local server_opts = {}

        local lspconfig = require("lspconfig")
        local mason = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- List of LSP servers to install and configure
        local servers = {
            "tsserver",
            "cssmodules_ls",
            "rust_analyzer",
            "pyright",
            "jsonls",
            "cssls",
            "lua_ls",
            "cmake",
            "html",
            "bashls",
            "clangd",
            "hls",
            "texlab",
        }

        -- This should install all the servers listed above
        mason.setup({
            ensure_installed = servers,
            automatic_installation = false,
            handlers = nil,
        })

        -- called whenever a language server is attached to a buffer
        server_opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false

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

        server_opts.capabilities = cmp_nvim_lsp.default_capabilities()
        server_opts.capabilities.offsetEncoding = { "utf-16" }

        -- Configure installed servers
        for _, server in ipairs(servers) do
            local opts_status, opts =
                pcall(require, "byut.external.lspconfig.settings." .. server)
            if opts_status then
                server_opts = vim.tbl_deep_extend("force", opts, server_opts)
            end

            lspconfig[server].setup(server_opts)
        end
    end,
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
    },
}
