-- Lsp config settings
require("lspconfig")

vim.lsp.config("rust-analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {},
	},
})

vim.lsp.config("lua-language-server", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		["lua-language-server"] = {},
	},
})

-- Enabling LSP's
vim.lsp.enable("lua-language-server")
vim.lsp.enable("rust-analyzer")

vim.diagnostic.config({ virtual_text = true })

-- Diagnostics keybinds
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "/d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "/u", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf, remap = false }
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "t", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
		vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts)
		vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)

		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
