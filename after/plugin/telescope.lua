local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    w = { "<cmd>Telescope live_grep<cr>", "Find Word" },
    o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=true},
  },
}, { prefix = "<leader>" })
