-- ===============================
-- MASON & LSP CONFIGURATION
-- ===============================

-- 1. Setup Mason first
require("mason").setup({
    ui = {
        check_outdated_packages_on_open = true,
        border = nil,
        backdrop = 100,
        width = 0.8,
        height = 0.9,
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- 2. Get capabilities from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. LSP keymaps (attached to buffers when LSP starts)
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    
    -- Go to definition/declaration
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    
    -- Hover documentation
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    
    -- Workspace symbol search
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    
    -- Show diagnostics
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    
    -- Go to next/previous diagnostic
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    
    -- Code actions
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    
    -- Show references
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    
    -- Rename symbol
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    
    -- Signature help
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

-- 4. Load lspconfig
local lspconfig = require("lspconfig")

-- 5. Setup individual language servers manually
-- Lua LSP
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Rust LSP
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})

-- Add more language servers here as needed
-- Example:
-- lspconfig.pyright.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

-- 6. Diagnostic configuration
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
