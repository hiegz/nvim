local mason_registry = require("mason-registry")
local lspconfig = require("lspconfig")
local conform = require("conform")

local function on_attach(client, bufnr)
    -- Ignore the ServerCancelled error from rust_analyzer
    for _, method in ipairs({
        "textDocument/diagnostic",
        "workspace/diagnostic",
    }) do
        local default_diagnostic_handler = vim.lsp.handlers[method]
        vim.lsp.handlers[method] = function(err, result, context, config)
            if context ~= nil and err ~= nil and err.code == -32802 then
                local c = vim.lsp.get_client_by_id(context.client_id)
                if c == client then
                    return
                end
            end
            return default_diagnostic_handler(err, result, context, config)
        end
    end

    require("byut.defaults.lsp").on_attach(client, bufnr)
end

local function setup_lsp()
    local server_opts = {}
    server_opts.on_attach = on_attach
    server_opts.capabilities = require("byut.defaults.lsp").capabilities()

    lspconfig["rust_analyzer"].setup(server_opts)
end

local lsp = mason_registry.get_package("rust-analyzer")
if not lsp:is_installed() then
    lsp:install():on("closed", vim.schedule_wrap(setup_lsp))
else
    setup_lsp()
end

-- this one has to be installed manually
conform.formatters_by_ft.rust = { "rustfmt" }
