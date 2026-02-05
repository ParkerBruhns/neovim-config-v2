-- Mason setup
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
			package_uninstalled = "✗",
		},
	},
})

-- Mason LSP config Setup
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
    "hls",
    "jdtls",
	},
})
