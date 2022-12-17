-- cryo -----------------------

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- my plugins here
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua' 
  use 'mbbill/undotree'

  -- colorschemes
  use 'folke/tokyonight.nvim'
  use 'lunarvim/darkplus.nvim'
  use 'morhetz/gruvbox'

  -- lualine
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }

  -- syntax highlighting 
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- fuzzy finder for vim
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- lsp
  use {
   'VonHeikemen/lsp-zero.nvim',
   requires = {
       -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
      }
   }

   -- chatgpt
   use({
      "jackMort/ChatGPT.nvim",
      config = function()
         require("chatgpt").setup({
         -- optional configuration
         })
      end,
      requires = {
         "MunifTanjim/nui.nvim",
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope.nvim"
      }
   })

  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
