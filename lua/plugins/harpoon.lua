return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	name = "harpoon",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	init = function()
		local harpoon = require("harpoon")
		harpoon:setup({})
		local conf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		local wk = require("which-key")
		wk.register({
			h = {
				name = "harpoon",
				a = {
					function()
						harpoon:list():add()
					end,
					"Append File",
				},
				t = {
					function()
						toggle_telescope(harpoon:list())
					end,
					"Telescope harpoons",
				},
				l = {
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					"Harpoon list",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
