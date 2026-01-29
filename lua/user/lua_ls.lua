-- LSP configuration with enhanced debugging

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable LSP logging
vim.lsp.set_log_level("DEBUG")

-- Start rust-analyzer when opening Rust files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function(args)
    local root_dir = vim.fs.root(args.buf, { 'Cargo.toml', 'rust-project.json' })
    
    if not root_dir then
      -- vim.notify("Warning: No Cargo.toml found. Looking in: " .. vim.fn.getcwd(), vim.log.levels.WARN)
      -- Try current directory as fallback
      root_dir = vim.fn.getcwd()
    end
    
    -- vim.notify("Starting rust-analyzer in: " .. root_dir, vim.log.levels.INFO)
    
    local client = vim.lsp.start({
      name = 'rust-analyzer',
      cmd = { 'rust-analyzer' },
      root_dir = root_dir,
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- vim.notify("rust-analyzer attached successfully!", vim.log.levels.INFO)
      end,
      on_exit = function(code, signal, client_id)
        if code ~= 0 then
          vim.notify(
            string.format("rust-analyzer exited with code %d, signal %d. Check :messages and ~/.local/state/nvim/lsp.log", code, signal),
            vim.log.levels.ERROR
          )
        end
      end,
    })
    
    -- if client then
    --   vim.notify("rust-analyzer started (client id: " .. client .. ")", vim.log.levels.INFO)
    -- else
    --   vim.notify("Failed to start rust-analyzer!", vim.log.levels.ERROR)
    -- end
  end,
})

-- Set up keybindings when LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    -- vim.notify("LSP attached: " .. client.name, vim.log.levels.INFO)
    
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
    -- Show diagnostics
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    -- Next/previous diagnostic
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})

-- Command to manually restart LSP
vim.api.nvim_create_user_command('LspRestart', function()
  vim.lsp.stop_client(vim.lsp.get_clients())
  vim.cmd('edit')
end, {})

-- Command to check LSP log
vim.api.nvim_create_user_command('LspLog', function()
  vim.cmd('edit ' .. vim.lsp.get_log_path())
end, {})

-- print("LSP config loaded - rust-analyzer will start on .rs files")
-- print("LSP log: " .. vim.lsp.get_log_path())
-- print("Use :LspLog to view the log, :LspRestart to restart")
