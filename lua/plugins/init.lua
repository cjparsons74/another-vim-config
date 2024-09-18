return {
	"tpope/vim-fugitive",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "tpope/vim-commentary" },
	{ "fladson/vim-kitty" },
	{ "will133/vim-dirdiff" },
	{ "rmagatti/auto-session", opts = {} },
	{ "mbbill/undotree" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
	},
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	init = function()
	-- 		require("leap").add_default_mappings()
	-- 	end,
	-- },
	{ "gpanders/editorconfig.nvim" },
}
