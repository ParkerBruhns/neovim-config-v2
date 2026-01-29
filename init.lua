require('user')
-- require('after')
-- require('nvim-treesitter.install').prefer_git = true

-- Add this to a file and source it in nvim with :luafile %
-- Or run these commands directly in nvim with :lua

print("=== LSP Debug Info ===")

-- Check if lspconfig is loaded
local ok, lspconfig = pcall(require, 'lspconfig')
print("lspconfig loaded:", ok)

-- Check active clients
local clients = vim.lsp.get_clients()
print("\nActive LSP clients:", #clients)
for _, client in ipairs(clients) do
  print("  - " .. client.name)
end

-- Check if rust-analyzer executable exists
local handle = io.popen("which rust-analyzer 2>/dev/null")
if handle then
  local result = handle:read("*a")
  handle:close()
  if result and result ~= "" then
    print("\nrust-analyzer found at:", result:gsub("\n", ""))
  else
    print("\nrust-analyzer NOT FOUND - you may need to install it")
  end
end

-- Check buffer filetype
print("\nCurrent buffer filetype:", vim.bo.filetype)

-- Check if LSP should attach to current buffer
print("LSP should attach to .rs files")

