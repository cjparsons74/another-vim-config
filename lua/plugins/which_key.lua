return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 1000
    end,
    config = function()
        local wk = require("which-key")
        wk.setup({})
        wk.add({
            { "<leader>f", group = "Find" },
            { "<leader>l", group = "Lsp" },
            { "<leader>q", group = "Operations" },
            { "<leader>y", group = "Yaml" },
        })
    end
}
