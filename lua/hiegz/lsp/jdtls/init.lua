local nvim_jdtls = require("jdtls")

local function setup_jdtls()
    local root_files = {
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
    }

    nvim_jdtls.start_or_attach({
        cmd = { "/usr/bin/jdtls" },
        settings = require("hiegz.lsp.jdtls.settings"),
        on_attach = require("hiegz.defaults.lsp").on_attach,
        capabilities = require("hiegz.defaults.lsp").capabilities(),
        root_dir = nvim_jdtls.setup.find_root(root_files),
    })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java" },
    desc = "Setup jdtls",
    callback = setup_jdtls,
})
