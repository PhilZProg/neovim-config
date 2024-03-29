--Set up
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })

-- Hybrid line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Yank to clipboard
vim.api.nvim_set_option("clipboard","unnamedplus")

-- Terminal
vim.keymap.set("n", "<Leader>tv", ":botright vnew <Bar> :terminal<cr>", { desc = "Open Vertical Terminal" })
vim.keymap.set("n", "<Leader>th", ":botright new <Bar> :terminal<cr>", { desc = "Open Horizontal Terminal" })

-- General bindings
vim.keymap.set("n", "<Leader>q", ":q<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "<Leader>w", ":w<cr>", { desc = "Save" })

-- Move lines
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", {silent = true})
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", {silent = true})

-- Split window
vim.keymap.set("n", "ss", ":sp<CR>", { silent = true })
vim.keymap.set("n", "sv", ":vsp<CR>", { silent = true })
-- Split resize
vim.keymap.set("n", "<A-S-E>", "<c-W>=", { silent = true })
vim.keymap.set("n", "<A-S-left>", "<c-W><3", { silent = true })
vim.keymap.set("n", "<A-S-right>", "<c-W>>3", { silent = true })
vim.keymap.set("n", "<A-S-up>", "<c-W>+", { silent = true })
vim.keymap.set("n", "<A-S-down>", "<c-W>-", { silent = true })
