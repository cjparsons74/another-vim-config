return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- 1. Get capabilities once for all servers
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 2. Define your server configs in one table
		local servers = {
			pyright = {
				capabilities = capabilities,
				root_dir = vim.fs.root(0, { ".git", "pyproject.toml", "setup.py", "pyrightconfig.json" }),
				-- settings = {
				-- 	pyright = { disableOrganizeImports = true },
				-- 	python = {
				-- 		analysis = {
				-- 			autoImportCompletions = true,
				-- 			typeCheckingMode = "basic", -- Optional: adjust as needed
				-- 		},
				-- 	},
				-- },
			},
			html = {
				capabilities = capabilities,
				filetypes = { "html", "templ", "javascriptreact", "typescriptreact" },
			},
			-- gopls = { capabilities = capabilities },
			lua_ls = { capabilities = capabilities },
			bashls = { capabilities = capabilities },
			terraformls = { capabilities = capabilities },
			quick_lint_js = { capabilities = capabilities },
		}

		-- 3. Register and Enable (The 0.11 Core way)
		-- This loop replaces all the individual .setup() calls
		for name, config in pairs(servers) do
			vim.lsp.config(name, config)
		end

		vim.lsp.enable(vim.tbl_keys(servers))

		-- 4. Keymaps (Standard LspAttach)
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf }
				-- Telescope mappings
				vim.keymap.set("n", "gd", function()
					require("telescope.builtin").lsp_definitions()
				end, opts)
				vim.keymap.set("n", "gr", function()
					require("telescope.builtin").lsp_references()
				end, opts)

				-- Standard LSP mappings
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})
	end,
}
