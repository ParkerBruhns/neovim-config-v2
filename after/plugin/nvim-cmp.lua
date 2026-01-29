local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Ctrl+Space to manually trigger completion
    ["<C-Space>"] = cmp.mapping.complete(),
    
    -- Enter to confirm completion
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    
    -- Tab to select next item
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    
    -- Shift+Tab to select previous item
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    
    -- Ctrl+d to scroll docs down
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    
    -- Ctrl+u to scroll docs up
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    
    -- Ctrl+e to abort completion
    ["<C-e>"] = cmp.mapping.abort(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },  -- LSP completions (most important!)
    { name = "luasnip" },   -- Snippet completions
  }, {
    { name = "buffer" },    -- Text from current buffer
  }),
  -- Optional: customize the completion menu appearance
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
