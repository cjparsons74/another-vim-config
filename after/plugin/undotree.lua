local wk = require("which-key")
wk.register({
  u = { vim.cmd.UndotreeToggle, "UndoTree" },
}, { prefix = "<leader>" })
