local vim = vim
local Plug = vim.fn["plug#"]

-- vim.cmd('set runtimepath+=~/.local/share/nvim/plugged')

vim.call("plug#begin")
-------------------------------------------------------------------------------
-- LSP's, DAP's, and Autocomplete
-- >> Dependencies << --
Plug("neovim/nvim-lspconfig")

Plug("nvim-lua/plenary.nvim")
Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
Plug("williamboman/mason-lspconfig.nvim")
Plug("nvim-telescope/telescope-ui-select.nvim")

-- File Management Plugins
Plug("theprimeagen/harpoon") -- Quick File Access
Plug("nvim-telescope/telescope.nvim") -- File Finder
Plug("tpope/vim-fugitive") -- Git Plugin

-- >> Autocompletion << --
Plug("tpope/vim-surround")

Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")

Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")
Plug("rafamadriz/friendly-snippets")

-- Settings and Colors
Plug("tpope/vim-sensible") -- Good Default Settings
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" }) -- Advanced Colors
Plug("navarasu/onedark.nvim") -- Color Scheme
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })
Plug("rose-pine/nvim", { ["as"] = "rose-pine" })


-- Visual Plugins
Plug("numToStr/Comment.nvim") -- Comments
Plug("m4xshen/autoclose.nvim") -- Auto Closing Brackets and such

Plug("mfussenegger/nvim-dap")
Plug("mfussenegger/nvim-jdtls")

-- Fun Plugins
Plug("ThePrimeagen/vim-be-good") -- Vim Practicer

-------------------------------------------------------------------------------
vim.call("plug#end")

require("autoclose").setup()
