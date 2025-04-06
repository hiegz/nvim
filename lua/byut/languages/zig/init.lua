local mason_registry = require("mason-registry")
local lspconfig = require("lspconfig")
local conform = require("conform")

local function setup_lsp()
    local server_opts = {}
    server_opts.on_attach = require("byut.defaults.lsp").on_attach
    server_opts.capabilities = require("byut.defaults.lsp").capabilities()

    lspconfig["zls"].setup(server_opts)
end

local lsp = mason_registry.get_package("zls")
if not lsp:is_installed() then
    lsp:install():on("closed", vim.schedule_wrap(setup_lsp))
else
    setup_lsp()
end

-- this one has to be installed manually
conform.formatters_by_ft.zig = { "zigfmt" }
