local mason_registry = require("mason-registry")
local nvim_jdtls = require("jdtls")

local lsp = mason_registry.get_package("jdtls")

local function get_launcher_jar()
    assert(lsp:is_installed())
    return vim.fn.glob(
        lsp:get_install_path() .. "/plugins/org.eclipse.equinox.launcher_*.jar"
    )
end

local function get_platform_config()
    assert(lsp:is_installed())
    if vim.fn.has("mac") == 1 then
        return lsp:get_install_path() .. "/config_mac"
    elseif vim.fn.has("unix") == 1 then
        return lsp:get_install_path() .. "/config_linux"
    elseif vim.fn.has("win32") == 1 then
        return lsp:get_install_path() .. "/config_win"
    end
    -- unreachable
    assert(false)
end

local function get_data_dir()
    return vim.fn.stdpath("cache")
        .. "nvim-jdtls/"
        .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
end

local function setup_jdtls()
    local root_files = {
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
    }

    local cmd = {
        "java",

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        "-jar",
        get_launcher_jar(),

        "-configuration",
        get_platform_config(),

        "-data",
        get_data_dir(),
    }

    nvim_jdtls.start_or_attach({
        cmd = cmd,
        settings = require("byut.languages.java.settings"),
        on_attach = require("byut.defaults.lsp").on_attach,
        capabilities = require("byut.defaults.lsp").capabilities(),
        root_dir = nvim_jdtls.setup.find_root(root_files),
    })
end

local function setup_lsp()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        desc = "Setup jdtls",
        callback = setup_jdtls,
    })
end

if not lsp:is_installed() then
    lsp:install():on("closed", vim.schedule_wrap(setup_lsp))
else
    setup_lsp()
end
