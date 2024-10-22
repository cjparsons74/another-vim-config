return {
    "tpope/vim-fugitive",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, { "tpope/vim-commentary" },
    { "fladson/vim-kitty" },

    { "rmagatti/auto-session",                    opts = {} },
    { "mbbill/undotree" },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
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
                }),
            })
            -- Set up lspconfig.
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            require("lspconfig").pyright.setup({
                capabilities = capabilities,
            })
        end,
    },
    { "chrisbra/recover.vim" },
    { "mfussenegger/nvim-dap" },
    { "leoluz/nvim-dap-go",        config = function() require('dap-go').setup() end },
    { "nvim-neotest/nvim-nio" },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dap, dapui = require('dap'), require('dapui')
            local dapgo = require('dap-go')
            dapui.setup()
            dapgo.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end


            -- Include the next few lines until the comment only if you feel you need it
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            -- Include everything after this


            vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
            vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<Leader>q', function()
                require('dap').toggle_breakpoint()
            end)
            vim.keymap.set('n', '<Leader>Q', function()
                require('dap').set_breakpoint()
            end)
            vim.keymap.set('n', '<Leader>lp', function()
                require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
            end)
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
            vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

            vim.keymap.set('n', '<Leader>w', function() dapui.open() end)
            vim.keymap.set('n', '<Leader>W', function() dapui.close() end)
        end
    },
}
