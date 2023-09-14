return {
"folke/which-key.nvim",
{'nvim-telescope/telescope.nvim',
branch='0.1.x', dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim"}
},
    {"cjparsons74/todo.txt-vim", lazy = false}, {'ggandor/leap.nvim'},
    {'fenetikm/falcon'},
    {'tpope/vim-fugitive'}, {'rose-pine/neovim'}, {"will133/vim-dirdiff"},
    {"vim-test/vim-test"},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {"theprimeagen/harpoon"},
    {"mbbill/undotree"},
    {"tpope/vim-fugitive"},
    {   'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
    },
    }

