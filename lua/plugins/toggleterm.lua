return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- size can be a number or function which is passed the current terminal
			size = 25,
			open_mapping = [[<c-T>]], -- This toggles the terminal
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float'
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
				winblend = 3,
			},
			on_open = function(term)
				vim.cmd("setlocal nospell")
				-- Optional: Also disable line numbers in the terminal for a cleaner look
				vim.cmd("setlocal nonumber norelativenumber")
				vim.cmd("setlocal nowinfixheight")
			end,
		})

		-- 2. Modern Keymaps for Terminal Mode
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			-- Esc to exit terminal mode (to use nvim motions like / or y)
			vim.keymap.set("t", "<C-Q>", [[<C-\><C-n>]], opts)
			-- Easier navigation between splits from within the terminal
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		-- Apply these mappings only when a terminal is open
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- 3. Auto-Insert on Focus
		-- This ensures that whenever you click or switch into a terminal,
		-- you can start typing immediately without hitting 'i'
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter" }, {
			pattern = "term://*",
			callback = function()
				vim.cmd("startinsert")
			end,
		})
		-- Cursor shapes:
		--  n-v-c: block (Normal, Visual, Command)
		--  i-ci-ve: vertical bar (Insert)
		--  r-cr: horizontal bar (Replace)
		vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

		-- Specifically for the Terminal:
		vim.api.nvim_create_autocmd("TermEnter", {
			callback = function()
				vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25" -- Ensure bar in terminal insert
			end,
		})
	end,
}
