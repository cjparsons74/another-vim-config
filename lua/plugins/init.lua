return {
	"tpope/vim-fugitive",

	{ "fladson/vim-kitty", enabled = not _G.is_windows },

	{ "rmagatti/auto-session", opts = {}, enabled = not _G.is_windows },
	{
		"ziontee113/icon-picker.nvim",
		dependencies = { "stevearc/dressing.nvim" }, -- optional, for nicer UI
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},
	{ "mbbill/undotree" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "gr",    mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "gR",    mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
	},
	{ "gpanders/editorconfig.nvim" },
	{
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<Tab>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "emoji" },
				}),
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").pyright.setup({
				capabilities = capabilities,
			})
			require("lspconfig").html.setup({
				capabilities = capabilities,
				filetypes = { "html", "templ", "javascriptreact", "typescriptreact" },
			})
		end,
	},
	{
		"hrsh7th/cmp-emoji",
		-- optional: only load when cmp is loaded
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			-- This just ensures it's registered as a source,
			-- you still need to add it in your cmp setup!
		end,
	},
	{ "chrisbra/recover.vim" },
	-- { "mfussenegger/nvim-dap" },
	-- { "leoluz/nvim-dap-go",        config = function() require('dap-go').setup() end },
	-- { "nvim-neotest/nvim-nio" },
	-- {
	--     "rcarriga/nvim-dap-ui",
	--     config = function()
	--         local dap, dapui = require('dap'), require('dapui')
	--         local dapgo = require('dap-go')
	--         dapui.setup()
	--         dapgo.setup()
	--         dap.listeners.before.attach.dapui_config = function()
	--             dapui.open()
	--         end
	--         dap.listeners.before.launch.dapui_config = function()
	--             dapui.open()
	--         end
	--
	--
	--         dap.listeners.before.event_terminated.dapui_config = function()
	--             dapui.close()
	--         end
	--         dap.listeners.before.event_exited.dapui_config = function()
	--             dapui.close()
	--         end
	--
	--
	--         vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
	--         vim.keymap.set('n', '<Leader>ds', function() require('dap').step_over() end)
	--         vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end)
	--         vim.keymap.set('n', '<Leader>do', function() require('dap').step_out() end)
	--         vim.keymap.set('n', '<Leader>db', function()
	--             require('dap').toggle_breakpoint()
	--         end)
	--         vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
	--         vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
	--
	--         vim.keymap.set('n', '<Leader>dw', function() dapui.open() end)
	--         vim.keymap.set('n', '<Leader>dW', function() dapui.close() end)
	--     end
	-- },
	{ "will133/vim-dirdiff" },
	{
		"tigion/nvim-asciidoc-preview",
		ft = { "asciidoc" },
		build = "cd server && npm install",
	},
	-- {
	--     'tigion/nvim-asciidoc-preview',
	--     ft = { 'asciidoc' },
	--     build = 'cd server && npm install',
	--     opts = {
	--         server = {
	--         },
	--         preview = {
	--             position = 'browser',
	--         },
	--     },
	-- },
	-- {
	--     dir = "~/Documents/eof-eol-marker.vim",
	--     name = "eof-marker",
	--     config = function()
	--         require('eof-marker').setup()
	--     end
	-- },
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		config = function()
			YAML_PLUGIN = require("yaml_nvim")
			YAML_PLUGIN.setup()
		end,
		keys = {
			{
				"<Leader>yk",
				mode = { "n" },
				function()
					YAML_PLUGIN.yank_key("+")
				end,
				desc = "YAML key to +",
			},
			{
				"<Leader>yy",
				mode = { "n" },
				function()
					YAML_PLUGIN.yank_all("+")
				end,
				desc = "Key & value to +",
			},
			{
				"<Leader>yq",
				mode = { "n" },
				function()
					YAML_PLUGIN.quickfix()
				end,
				desc = "YAML to quickfix",
			},
			{
				"<Leader>yt",
				mode = { "n" },
				function()
					YAML_PLUGIN.telescope()
				end,
				desc = "YAML to telescope",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({ move_cursor = false })
		end,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				view = {
					default = {
						winbar_info = true, -- This adds the branch/commit info to the top of each window
					},
				},
				hooks = {
					diff_buf_read = function(bufnr)
						vim.schedule(function()
							if not vim.api.nvim_buf_is_valid(bufnr) then
								return
							end

							-- Get the actual internal name of the buffer
							local bufname = vim.api.nvim_buf_get_name(bufnr)
							local rev = "WORKING COPY"

							-- 1. If it's a diffview buffer, extract the branch/hash from the URI
							-- Pattern matches 'diffview://objects/<branch_name>/...'
							if bufname:match("^diffview://") then
								rev = bufname:match("diffview://objects/([^/]+)/") or "UNKNOWN"
							end

							-- 2. Cleanup: If it's a long hash, shorten it
							if #rev > 12 then
								rev = rev:sub(1, 10) .. ".."
							end

							-- 3. The Label
							local label = "   " .. rev:upper() .. "  │  %t %m"

							-- 4. Find windows showing this buffer and set the winbar
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								if vim.api.nvim_win_get_buf(win) == bufnr then
									vim.api.nvim_set_option_value("winbar", label, { scope = "local", win = win })
								end
							end
						end)
					end,
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
			-- This is the "Primeagen trick":
			-- Make sure Neovim can find Mason's binaries in your shell path
			vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
		end,
	},
	{
		"fenetikm/falcon", -- Assuming this is the falcon you're using
		priority = 1000, -- Make sure it loads first
		config = function()
			vim.opt.termguicolors = true
			vim.cmd([[colorscheme falcon]])
		end,
	},
	{
		-- used for linters that are not language servers i.e. cmdline tools
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Define which linters to run for which filetypes
			lint.linters_by_ft = {
				html = { "djlint" },
				django = { "djlint" },
				jinja = { "djlint" },
			}
			lint.linters.djlint.args = {
				"--lint",
				"--searchpath",
				vim.fn.getcwd(), -- Forces it to look in your current Neovim directory
				"-",
			}

			-- Create an autocmd to trigger linting
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	-- { "cjparsons74/eof-eol-marker.vim", config = function() require("eof-marker").setup() end },
}
