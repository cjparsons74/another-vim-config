return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			sh = { "shfmt" },
			html = { "djlint" },
			lua = { "stylua" },
			python = { "ruff_format" },
			terraform = { "terraform_fmt" },
			tf = { "terraform_fmt" },
			tfvars = { "terraform_fmt" },
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 1500, lsp_fallback = true },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
