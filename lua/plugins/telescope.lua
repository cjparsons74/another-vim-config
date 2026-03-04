return {
	"nvim-telescope/telescope.nvim",
	name = "telescope",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		{ "nvim-telescope/telescope-fzf-native.nvim", enabled = not is_windows, build = "make" },
	},

	config = function()
		require("telescope").setup({
			defaults = {
				path_display = {
					filename_first = {
						reverse_directories = true,
					},
				},
			},
			live_grep_args = { auto_quoting = false },
			pickers = { colorscheme = { enable_preview = true } },
		})
		if not is_windows then
			require("telescope").load_extension("fzf")
		end
	end,
	keys = {
		{
			"<Leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<Leader>fc",
			function()
				require("telescope.builtin").treesitter({ symbols = { "variable", "function", "method", "class" } })
			end,
			desc = "Code elements",
		},
		{
			"<Leader>fC",
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			desc = "Colour schemes",
		},
		{
			"<Leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<Leader>fg",
			function()
				require("telescope.builtin").spell_suggest()
			end,
			desc = "Spellings",
		},
		{
			"<Leader>fh",
			function()
				require("telescope.builtin").command_history()
			end,
			desc = "Command history",
		},
		{
			"<Leader>fo",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Recent files",
		},
		{
			"<Leader>fs",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Current buffer",
		},
		{
			"<Leader>fw",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Word",
		},
		{
			"<Leader>fW",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Word under cursor",
		},
	},
}
