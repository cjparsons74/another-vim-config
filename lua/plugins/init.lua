return {
	"tpope/vim-fugitive",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "tpope/vim-commentary" },
	{ "will133/vim-dirdiff" },
	{ "rmagatti/auto-session", opts = {} },
	{ "mbbill/undotree" },
	{
		"ggandor/leap.nvim",
		init = function()
			require("leap").add_default_mappings()
		end,
	},
	{ "gpanders/editorconfig.nvim" },
}
