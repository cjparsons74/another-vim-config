local wk = require("which-key")

wk.register({
	["[d"] = { vim.diagnostic.goto_prev, "Diagnostic prev" },
	["]d"] = { vim.diagnostic.goto_next, "Diagnostic next" },
})

wk.register({
	l = {
		name = "lsp",
		F = { vim.diagnostic.open_float, "Diagnostic float" },
		l = { vim.diagnostic.setloclist, "Diagnostic list" },
	},
}, { prefix = "<leader>" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		wk.register({
			["gd"] = { vim.lsp.buf.definition, "Goto definition" },
			["gi"] = { vim.lsp.buf.implementation, "Goto implementation" },
			["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
			["K"] = { vim.lsp.buf.hover, "Hover" },
		})
		wk.register({
			l = {
				name = "lsp",
				d = { vim.diagnostic.open_float, "Diagnostic float" },
				s = { vim.lsp.buf.signature_help, "Signature help" },
				a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
				x = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
				l = {
					function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					"List workspace folders",
				},
				D = { vim.lsp.buf.type_definition, "Type definition" },
				R = { vim.lsp.buf.rename, "Rename" },
				c = { vim.lsp.buf.code_action, "Code action" },
				r = { vim.lsp.buf.references, "References" },
				-- Disabled because of conform.nvim
				-- f = {
				-- 	function()
				-- 		vim.lsp.buf.format({ async = true })
				-- 	end,
				-- 	"Reformat",
				-- },
			},
		}, { prefix = "<leader>" })
	end,
})
