vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic prev" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic next" })

vim.keymap.set("n", "<Leader>lF", vim.diagnostic.open_float, { desc = "Diagnostic float" })
vim.keymap.set("n", "<Leader>ll", vim.diagnostic.setloclist, { desc = "Diagnostic list" })
--
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "<Leader>ld", vim.diagnostic.open_float, { desc = "Diagnostic float" })
        vim.keymap.set("n", "<Leader>ls", vim.lsp.buf.signature_help, { desc = "Signature help" })
        vim.keymap.set("n", "<Leader>la", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
        vim.keymap.set("n", "<Leader>lx", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
        vim.keymap.set("n", "<Leader>ll", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            { desc = "List workspace folders" })
        vim.keymap.set("n", "<Leader>lD", vim.lsp.buf.type_definition, { desc = "Type definition" })
        vim.keymap.set("n", "<Leader>lR", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set("n", "<Leader>lc", vim.lsp.buf.code_action, { desc = "Code action" })
        vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.references, { desc = "References" })
    end,
})
