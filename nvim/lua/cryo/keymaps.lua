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

-- floaterm 
vim.g.floaterm_keymap_new = '<Leader>tt'
vim.g.floaterm_keymap_prev   = '<F10>'
vim.g.floaterm_keymap_next   = '<F11>'
vim.g.floaterm_keymap_toggle = '<F12>'
vim.g.floaterm_keymap_kill   = '<F9>'


