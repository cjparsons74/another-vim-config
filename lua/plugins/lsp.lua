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
		-- 2. Define your server configs in one table
		local servers = {
			pyright = {
				capabilities = capabilities,
				-- Modern Nvim 0.11/0.12 signature: (bufnr, on_dir)
				root_dir = function(bufnr, on_dir)
					local fname = vim.api.nvim_buf_get_name(bufnr)
					local root = vim.fs.root(fname, { "pyproject.toml", "setup.py", "pyrightconfig.json", ".git" })
					if root then
						on_dir(root)
					end
				end,
			},
			html = {
				capabilities = capabilities,
				filetypes = { "html", "templ", "javascriptreact", "typescriptreact" },
			},
			lua_ls = { capabilities = capabilities },
			bashls = { capabilities = capabilities },
			clangd = { capabilities = capabilities },
			yamlls = { capabilities = capabilities },

			terraformls = {
				capabilities = capabilities,
				-- Strictly search for local project anchors so it NEVER jumps to monorepo root
				root_dir = function(bufnr, on_dir)
					local fname = vim.api.nvim_buf_get_name(bufnr)
					local root = vim.fs.root(fname, { ".terraform", ".terraform.lock.hcl", "main.tf", "variables.tf" })
					if root then
						on_dir(root)
					end
				end,
			},

			quick_lint_js = { capabilities = capabilities },
			jsonls = { capabilities = capabilities },
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
