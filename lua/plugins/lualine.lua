return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true, -- One statusline for the whole screen
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path
					},
				},
				lualine_x = {
					{
						function()
							-- This custom component shows the Diffview branch if active
							local lib = require("diffview.lib")
							local view = lib.get_current_view()
							if view then
								return "Diff: " .. view.ctx.args.raw[1]
							end
							return ""
						end,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
