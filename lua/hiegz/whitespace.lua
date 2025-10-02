-- stylua: ignore start

local augroup = vim.api.nvim_create_augroup("TrailingWhitespace", { clear = true })
local matchid = {}
local ns_id   = 0 -- global namespace
local hlname  = "TrailingWhitespaceHighlight"

vim.api.nvim_set_hl(ns_id, "TrailingWhitespaceHighlight", { underline = true })

local function highlight_on()
    local winid = vim.api.nvim_get_current_win()
    if matchid[winid] ~= nil then
        local ret = vim.fn.matchdelete(matchid[winid])
        assert(ret == 0)
        matchid[winid] = nil
    end
    matchid[winid] = vim.fn.matchadd(hlname, [[\s\+$]])
end

local function highlight_off()
    local winid = vim.api.nvim_get_current_win()
    if matchid[winid] ~= nil then
        local ret = vim.fn.matchdelete(matchid[winid])
        assert(ret == 0)
        matchid[winid] = nil
    end
end

vim.api.nvim_create_autocmd(
    { "BufEnter", "WinEnter", "TermEnter", "InsertLeave" },
    { group  = augroup, callback = highlight_on }
)

vim.api.nvim_create_autocmd(
    { "BufLeave", "WinLeave", "TermLeave", "InsertEnter" },
    { group = augroup, callback = highlight_off }
)
