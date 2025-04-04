local diagnostic_severity = vim.diagnostic.severity
local signs = {
  [diagnostic_severity.ERROR] = "󰅙",
  [diagnostic_severity.WARN] = "",
  [diagnostic_severity.INFO] = "󰋼",
  [diagnostic_severity.HINT] = "󰭻",
}

vim.diagnostic.config({ signs = {text = signs}, virtual_text = { prefix = "󰜱" }})
