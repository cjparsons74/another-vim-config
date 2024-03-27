return {
    "nvim-telescope/telescope.nvim",
    name = "telescope",

    dependencies = {
        "nvim-lua/plenary.nvim",
	"BurntSushi/ripgrep",
	"nvim-telescope/telescope-fzf-native.nvim",
    },

    config = function()
        require('telescope').setup({ live_grep_args = {auto_quoting = false}})
	require('telescope').load_extension('fzf')
	local wk = require("which-key")

	wk.register({
	  f = {
	    name = "file",
	    f = { "<cmd>Telescope find_files<cr>", "Find File" },
	    w = { "<cmd>Telescope live_grep<cr>", "Find Word" },
	    o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=true},
	    h = { "<cmd>Telescope command_history<cr>", "Command History"},
	    t = { "<cmd>Telescope treesitter<cr>", "Treesitter names and variables"},
	  },
	}, { prefix = "<leader>" })
    end
}
