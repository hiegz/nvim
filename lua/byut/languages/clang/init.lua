local mason_registry = require("mason-registry")
local lspconfig = require("lspconfig")
local conform = require("conform")

local function setup_lsp()
    local server_opts = {}
    server_opts.on_attach = require("byut.defaults.lsp").on_attach
    server_opts.capabilities = require("byut.defaults.lsp").capabilities()

    lspconfig["clangd"].setup(server_opts)
end

local lsp = mason_registry.get_package("clangd")
if not lsp:is_installed() then
    lsp:install():on("closed", vim.schedule_wrap(setup_lsp))
else
    setup_lsp()
end

local function setup_formatter()
    conform.formatters_by_ft.c = { "clang-format" }
    conform.formatters_by_ft.cpp = { "clang-format" }
end

local formatter = mason_registry.get_package("clang-format")
if not formatter:is_installed() then
    formatter:install():on("closed", vim.schedule_wrap(setup_formatter))
else
    setup_formatter()
end
