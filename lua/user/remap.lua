vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Search tools
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Copy and Paste
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- IDK
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("x", "<leader>pz", "\"_dP")

-- Tab Shortcuts
vim.keymap.set("n", "<leader>ti", vim.cmd.tabe)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabp)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabn)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabc)

-- Clipboard
-- set clipboard = unnamedplus
