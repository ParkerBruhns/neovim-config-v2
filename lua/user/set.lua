vop = vim.opt

vim.g.mapleader = " "

vop.nu = true
vop.relativenumber = true

vop.tabstop = 2
vop.softtabstop = 2
vop.shiftwidth = 2
vop.expandtab = true

vop.wrap = false

--o.swapfile = false
--o.backup = false
--o.undodir = os.getenv("HOME") .. "/.vim/undodir"
--o.undofile = true

vop.hlsearch = false
vop.incsearch = true

vop.termguicolors = true

vop.scrolloff = 15
vop.signcolumn = "no"
vop.isfname:append("@-@")

vop.updatetime = 50

vop.colorcolumn = "80"

-- vim.opt.winborder = 'rounded'
