require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<S-Left>", "<C-w>h", opts)
map("n", "<S-Down>", "<C-w>j", opts)
map("n", "<S-Up>", "<C-w>k", opts)
map("n", "<S-Right>", "<C-w>l", opts)
map("n", "<A-Right>", ":bnext<cr>", opts)
map("n", "<A-Left>", ":bprev<cr>", opts)
map("i", "<C-s>", "<Esc>:w!<Esc>i", opts)
map("n", "<C-s>", ":w!<cr>", opts)
map("i", "<A-s>", "<Esc>:wall!<Esc>i", opts)
map("n", "<A-s>", ":wall!<cr>", opts)
map("n", "<M-0>", ":close<CR>", opts)
map("n", "<M-1>", ":only<CR>", opts)
map("n", "<M-2>", ":split<cr>", opts)
map("n", "<M-3>", ":vsplit<cr>", opts)

