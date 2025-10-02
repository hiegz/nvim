vim.lsp.config("lua_ls", {
    on_attach = require("hiegz.defaults.lsp").on_attach,
    capabilities = require("hiegz.defaults.lsp").capabilities(),
    settings = require("hiegz.lsp.lua_ls.settings"),
})

vim.lsp.enable("lua_ls")
