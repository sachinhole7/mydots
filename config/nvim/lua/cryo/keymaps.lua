-- cryo --------------
local keymap = vim.keymap

-- leader key
vim.g.mapleader = " "

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "<C-s>", "<cmd>:w<cr>")
keymap.set("n", "<C-s>", "<cmd>:w<cr>")

-- nvim tree 
keymap.set("n", "<leader>l", vim.cmd.Lex)

-- commenter
vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })

-- floaterm 
-- vim.g.floaterm_keymap_new = '<Leader>tt'
-- vim.g.floaterm_keymap_prev   = '<F10>'
-- vim.g.floaterm_keymap_next   = '<F11>'
-- vim.g.floaterm_keymap_toggle = '<F12>'
-- vim.g.floaterm_keymap_kill   = '<F9>'

