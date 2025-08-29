return {
    "nvim-telescope/telescope.nvim",
    name = "telescope",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "nvim-telescope/telescope-fzf-native.nvim",
    },

    config = function()
        require("telescope").setup({
            defaults = {
                path_display = {
                    filename_first = {
                        reverse_directories = true
                    }
                },
            },
            live_grep_args = { auto_quoting = false },
            pickers = { colorscheme = { enable_preview = true } },
        })
        require("telescope").load_extension("fzf")
    end,
    keys = {
        { '<Leader>fb', '<cmd>Telescope buffers<CR>',                   desc = 'Buffers' },
        { '<Leader>fc', '<cmd>Telescope colorscheme<CR>',               desc = 'Colour schemes' },
        { '<Leader>ff', '<cmd>Telescope find_files<CR>',                desc = 'Find files' },
        { '<Leader>fg', '<cmd>Telescope spell_suggest<CR>',             desc = 'Spellings' },
        { '<Leader>fh', '<cmd>Telescope command_history<CR>',           desc = 'Command history' },
        { '<Leader>fo', '<cmd>Telescope oldfiles<CR>',                  desc = 'Recent files' },
        { '<Leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Current buffer' },
        { '<Leader>fw', '<cmd>Telescope live_grep<CR>',                 desc = 'Word' },
        { '<Leader>fW', '<cmd>Telescope grep_string<CR>',               desc = 'Word under cursor' },
    },
}
