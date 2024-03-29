local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})
