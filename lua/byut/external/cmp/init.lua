return {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-n>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                ["<C-p>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
            }),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "buffer" },
            }),
        })
    end,
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
}
