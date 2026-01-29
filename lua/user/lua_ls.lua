-- LSP configuration using the new-style API
-- nvim-lspconfig provides vim.lsp.config through require('lspconfig.configs')

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- This initializes the config system
local configs = require('lspconfig.configs')

-- Configure rust_analyzer
if not configs.rust_analyzer then
  configs.rust_analyzer = {
    default_config = {
      cmd = { 'rust-analyzer' },
      filetypes = { 'rust' },
      root_dir = function(fname)
        return vim.fs.root(fname, { 'Cargo.toml', 'rust-project.json' })
      end,
      capabilities = capabilities,
      settings = {
        ['rust-analyzer'] = {}
      }
    }
  }
end

-- Enable rust_analyzer
require('lspconfig').rust_analyzer.setup({
  capabilities = capabilities,
})

-- Optional: Set up keybindings when LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    -- Go to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- Hover documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- Rename symbol
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    -- Code actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    -- Show references
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
