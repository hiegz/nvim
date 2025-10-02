--
-- wsl.lua
--
--

if not os.getenv("WSL_INTEROP") or not os.getenv("WSL_DISTRO_NAME") then
    return
end

vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
        ["+"] = "win32yank -i --crlf",
        ["*"] = "win32yank -i --crlf",
    },
    paste = {
        ["+"] = "win32yank -o --lf",
        ["*"] = "win32yank -o --lf",
    },
    cache_enabled = true,
}
