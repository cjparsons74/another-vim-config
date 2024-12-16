return {
    "tpope/vim-fugitive",

    { "fladson/vim-kitty" },

    { "rmagatti/auto-session", opts = {} },
    { "mbbill/undotree" },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        -- stylua: ignore
        keys = {
            { "gs",    mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "gS",    mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
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
    { 'will133/vim-dirdiff' },
    {
        'tigion/nvim-asciidoc-preview',
        ft = { 'asciidoc' },
        build = 'cd server && npm install',
        opts = {
            server = {
                converter = 'js'
            },
            preview = {
                position = 'current',
            },
        },
    },
    {
        dir = "~/Documents/eof-eol-marker.vim",
        name = "eof-marker",
        config = function()
            require('eof-marker').setup()
        end
    },
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" },
        config = function()
            YAML_PLUGIN = require('yaml_nvim')
            YAML_PLUGIN.setup()
        end,
        keys = {
            { '<Leader>yk', mode = { "n" }, function() YAML_PLUGIN.yank_key("+") end, desc = "YAML key to +" },
            { '<Leader>yy', mode = { "n" }, function() YAML_PLUGIN.yank_all("+") end, desc = "Key & value to +" },
            { '<Leader>yq', mode = { "n" }, function() YAML_PLUGIN.quickfix() end,    desc = "YAML to quickfix" },
            { '<Leader>yt', mode = { "n" }, function() YAML_PLUGIN.telescope() end,   desc = "YAML to telescope" },
        }
    },
    {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
            })
        end
    }
    -- { "cjparsons74/eof-eol-marker.vim", config = function() require("eof-marker").setup() end },
}
