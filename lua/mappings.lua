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
map("n", "<C-0>", ":close<CR>", opts)
map("n", "<C-1>", ":only<CR>", opts)
map("n", "<C-2>", ":split<cr>", opts)
map("n", "<C-3>", ":vsplit<cr>", opts)
map("i", "<C-Up>", "<Esc>{<Esc>i", opts)
map("i", "<C-Down>", "<Esc>}<Esc>i", opts)
map("n", "<C-Up>", "{", opts)
map("n", "<C-Down>", "}", opts)
map("v", "<C-Up>", "{", opts)
map("v", "<C-Down>", "}", opts)
map("n", "K", "{", opts)
map("n", "J", "}", opts)
map("v", "K", "{", opts)
map("v", "J", "}", opts)


map('n', '<A-Down>', ':MoveLine(1)<CR>', opts)
map('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
map('i', '<A-Down>', '<Esc>:MoveLine(1)<CR>i', opts)
map('i', '<A-Up>', '<Esc>:MoveLine(-1)<CR>i', opts)

map('n', '<A-Left>', ':MoveHChar(-1)<CR>', opts)
map('n', '<A-Right>', ':MoveHChar(1)<CR>', opts)
map('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
map('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)
map('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)
map('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
map('v', '<A-Left>', ':MoveHBlock(-1)<CR>', opts)
map('v', '<A-Right>', ':MoveHBlock(1)<CR>', opts)
