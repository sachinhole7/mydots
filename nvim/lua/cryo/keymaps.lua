-- cryo --------------
local keymap = vim.keymap

-- leader key
vim.g.mapleader = " "

-- general keymaps
keymap.set("i", "jk", "<ESC>")

-- undotree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- chatgpt
keymap.set("n", "<leader>c", vim.cmd.ChatGPT)
