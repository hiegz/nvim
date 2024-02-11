--
-- colors.lua
--
--

-- A list of all available colorschemes
local colorschemes = vim.fn.getcompletion("", "color")

--- Retrieve the most recently used colorscheme
-- @return string|nil
local function retrieve_colorscheme()
    local file = io.open(vim.fn.stdpath("data") .. "/color", "r")
    if not file then
        return nil
    end

    local data = file:read("*a")
    file:close()

    local colorscheme, _ = data:gsub("[\n\r]", "")
    return colorscheme
end

--- Record the name of the newly applied colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(info)
        local colorscheme = info.match
        if not vim.tbl_contains(colorschemes, colorscheme) then
            return
        end

        -- Remove background colors
        for _, group_name in ipairs({
            "Normal",
            "NormalNC",
            "CursorLineNr",
            "CursorLineSign",
            "CursorLineFold",
            "SignColumn",
            "EndOfBuffer",
            "LineNr",
            "NonText",
        }) do
            vim.cmd(
                string.format(
                    "highlight %s guibg=NONE ctermbg=NONE",
                    group_name
                )
            )
        end

        local file = io.open(vim.fn.stdpath("data") .. "/color", "w")
        if not file then
            return
        end

        file:write(string.format("%s\n\r", colorscheme))
        file:flush()
        file:close()
    end,
})

local colorscheme = retrieve_colorscheme()
if colorscheme and vim.tbl_contains(colorschemes, colorscheme) then
    vim.cmd.colorscheme(colorscheme)
else
    vim.cmd.colorscheme("default")
end
