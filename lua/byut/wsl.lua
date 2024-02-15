--
-- wsl.lua
--
--

if not os.getenv("WSL_INTEROP") or not os.getenv("WSL_DISTRO_NAME") then
    return
end

vim.opt.clipboard = ""
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function(ev)
        if vim.fn.executable("clip.exe") == 1 then
            local jobid = vim.fn.jobstart("clip.exe")
            vim.fn.chansend(jobid, vim.fn.getreg('"'))
            vim.fn.chanclose(jobid, "stdin")
        end
    end,
})
