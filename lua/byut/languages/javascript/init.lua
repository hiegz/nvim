local mason_registry = require("mason-registry")
local lspconfig = require("lspconfig")
local conform = require("conform")

local function setup_lsp()
    local server_opts = {}
    server_opts.on_attach = require("byut.defaults.lsp").on_attach
    server_opts.capabilities = require("byut.defaults.lsp").capabilities()
    server_opts.settings = require("byut.languages.javascript.settings")

    lspconfig["ts_ls"].setup(server_opts)
end

local lsp = mason_registry.get_package("typescript-language-server")
if not lsp:is_installed() then
    lsp:install():on("closed", vim.schedule_wrap(setup_lsp))
else
    setup_lsp()
end

local function setup_prettierd()
    conform.formatters_by_ft.javascript = conform.formatters_by_ft.javascript or {}
    table.insert(conform.formatters_by_ft.javascript, "prettierd")
    conform.formatters_by_ft.typescript = conform.formatters_by_ft.typescript or {}
    table.insert(conform.formatters_by_ft.typescript, "prettierd")
end

local prettierd = mason_registry.get_package("prettierd")
if not prettierd:is_installed() then
    prettierd:install():on("closed", vim.schedule_wrap(setup_prettierd))
else
    setup_prettierd()
end

local function setup_prettier()
    conform.formatters_by_ft.javascript = conform.formatters_by_ft.javascript or {}
    table.insert(conform.formatters_by_ft.javascript, "prettier")
    conform.formatters_by_ft.typescript = conform.formatters_by_ft.typescript or {}
    table.insert(conform.formatters_by_ft.typescript, "prettier")
end

local prettier = mason_registry.get_package("prettier")
if not prettier:is_installed() then
    prettier:install():on("closed", vim.schedule_wrap(setup_prettier))
else
    setup_prettier()
end
