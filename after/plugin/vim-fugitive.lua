local wk = require("which-key")

wk.register({
  g = { vim.cmd.Git, "Git" },
}, { prefix = "<leader>" })
