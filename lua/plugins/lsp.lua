return {
	"neovim/nvim-lspconfig",
	dependencies = { "folke/neodev.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
		-- lspconfig.ruff.setup({
		-- 	init_options = {
		-- 		settings = {
		-- 			-- Any extra CLI arguments for `ruff` go here.
		-- 			args = { "--preview" },
		-- 		},
		-- 	},
		-- on_attach = function(client, bufnr)
		-- 	if client.name == "ruff_lsp" then
		-- 		-- Disable hover in favor of Pyright
		-- 		client.server_capabilities.hoverProvider = false
		-- 	end
		-- end,
		-- })
		lspconfig.pyright.setup({
			settings = {
				pyright = {
					-- -- Using Ruff's import organizer
					-- disableOrganizeImports = true,
				},
				python = {
					analysis = {
						-- Ignore all files for analysis to exclusively use Ruff for linting
						-- ignore = { "*" },
					},
				},
			},
		})
		require("neodev").setup({})

		lspconfig.lua_ls.setup({})
		lspconfig.gopls.setup({
			settings = {
				gopls = {
					directoryFilters = { "-plz-out" },
					linksInHover = false,
					analyses = {
						unusedparams = true,
					},
					usePlaceholders = false,
					semanticTokens = true,
					codelenses = {
						gc_details = true,
					},
					staticcheck = true,
				},
			},
		})
		lspconfig.html.setup({
			filetypes = { "html", "templ" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = false, -- Set to false since you use Conform/djlint
			},
		})
		lspconfig.bashls.setup({})
		lspconfig.quick_lint_js.setup({})
		require("lspconfig").terraformls.setup({})
	end,
}
