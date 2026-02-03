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
