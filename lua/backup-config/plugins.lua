return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "onsails/lspkind-nvim"
  use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/plenary.nvim"}}}
  use "morhetz/gruvbox"
  use "EdenEast/nightfox.nvim"
  use "tpope/vim-fugitive"
  use {
    "rmagatti/session-lens",
    requires = {"rmagatti/auto-session", "nvim-telescope/telescope.nvim"},
    config = require("plugins/session-lens")
  }
  use "numToStr/Comment.nvim"
  use "puremourning/vimspector"
  use "sbdchd/neoformat"
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "norcalli/nvim-colorizer.lua"
  use {
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  }
  use "kylechui/nvim-surround"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons" -- optional, for file icons
    }
  }
end)
