local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    w = { "<cmd>Telescope grep_string<cr>", "Find Word" },
    o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=true}, -- additional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
  },
}, { prefix = "<leader>" })
