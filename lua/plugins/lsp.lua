return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		-- pip install ruff-lsp
		-- pip install pyright
		-- brew install lua-language-server
		-- npm i -g bash-language-server
		-- brew install shellcheck
		lspconfig.ruff_lsp.setup({
			init_options = {
				settings = {
					-- Any extra CLI arguments for `ruff` go here.
					args = {},
				},
			},
			on_attach = function(client, bufnr)
				if client.name == "ruff_lsp" then
					-- Disable hover in favor of Pyright
					client.server_capabilities.hoverProvider = false
				end
			end,
		})
		lspconfig.pyright.setup({
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						-- Ignore all files for analysis to exclusively use Ruff for linting
						ignore = { "*" },
					},
				},
			},
		})
		lspconfig.lua_ls.setup({})
		lspconfig.bashls.setup({})
	end,
}
