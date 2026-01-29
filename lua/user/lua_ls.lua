local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
})

-- return {
--   cmd = { 'lua-language-server'}, 
--
--   filetypes = { 'lua' },
--
--   root_markers = { {'.luarc.json', '.luarc.jsonc' }, '.git' },
--
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         globals = { 'vim' },
--       },
--     }
--   }
-- }

