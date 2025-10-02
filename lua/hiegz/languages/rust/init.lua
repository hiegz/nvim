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

    require("hiegz.defaults.lsp").on_attach(client, bufnr)
end

lspconfig["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
})

-- this one has to be installed manually
conform.formatters_by_ft.rust = { "rustfmt" }
