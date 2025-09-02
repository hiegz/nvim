local augroup =
    vim.api.nvim_create_augroup("TrailingWhitespace", { clear = true })

local matchid = nil

vim.api.nvim_set_hl(0, "TrailingWhitespaceHighlight", {
    underline = true,
})

vim.api.nvim_create_autocmd(
    { "BufEnter", "WinEnter", "TermEnter", "InsertLeave" },
    {
        group = augroup,
        callback = function()
            if vim.bo.buftype == "" and matchid == nil then
                matchid =
                    vim.fn.matchadd("TrailingWhitespaceHighlight", [[\s\+$]])
            end
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "BufLeave", "WinLeave", "TermLeave", "InsertEnter" },
    {
        group = augroup,
        callback = function()
            if matchid then
                vim.fn.matchdelete(matchid)
                matchid = nil
            end
        end,
    }
)
