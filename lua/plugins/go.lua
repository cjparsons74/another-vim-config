return {
	"ray-x/go.nvim",
	enabled = not (_G.is_mac or _G.is_windows),
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
	},
	config = function()
		require("go").setup({
			lsp_cfg = true,
			trouble = true,
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
