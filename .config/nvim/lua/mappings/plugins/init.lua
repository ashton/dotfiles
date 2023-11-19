local nvim_tree_mappings = require "mappings/plugins/nvim-tree"
local neotest_mappings = require "mappings/plugins/neotest"
local telesecope_mappings = require "mappings/plugins/telescope"
local neogit_mappings = require "mappings/plugins/neogit"
local lsp_mappings = require "mappings/plugins/lsp"
local debug_mappings = require "mappings/plugins/dap"

local mappings =
    vim.tbl_deep_extend(
      "force",
      nvim_tree_mappings,
      neotest_mappings,
      lsp_mappings,
      telesecope_mappings,
      neogit_mappings,
      debug_mappings
    )

return mappings
