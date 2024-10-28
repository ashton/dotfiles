local wk = require "which-key"
local plugin_mappings = require "mappings/plugins"
local global_mappings = require "mappings/global"

vim.g.mapleader = " "

local mappings = vim.tbl_deep_extend(
  "force",
  global_mappings,
  plugin_mappings
)

for k, v in pairs(mappings) do
  wk.register(v, { prefix = k, silent = true, noremap = true })
end
