require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Scroll down/up without moving the cursor
map("n", "<C-e>", "<C-e>zz", { noremap = true })
map("n", "<C-y>", "<C-y>zz", { noremap = true })
