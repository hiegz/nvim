local mason_registry = require("mason-registry")
local lspconfig = require("lspconfig")
local conform = require("conform")

local function setup_lsp()
    local server_opts = {}
    server_opts.on_attach = require("byut.defaults.lsp").on_attach
    server_opts.capabilities = require("byut.defaults.lsp").capabilities()
    server_opts.settings = require("byut.languages.python.settings")

    lspconfig["pyright"].setup(server_opts)
end

local lsp = mason_registry.get_package("pyright")
if not lsp:is_installed() then
    lsp:install():on("closed", vim.schedule_wrap(setup_lsp))
else
    setup_lsp()
end

local function setup_formatter()
    conform.formatters_by_ft.python = { "black" }
end

local formatter = mason_registry.get_package("black")
if not formatter:is_installed() then
    formatter:install():on("closed", vim.schedule_wrap(setup_formatter))
else
    setup_formatter()
end
