local nvim_tree_mappings = require "mappings/plugins/nvim-tree"
local vim_test_mappings = require "mappings/plugins/vim-test"
local telesecope_mappings = require "mappings/plugins/telescope"
local neogit_mappings = require "mappings/plugins/neogit"
local lsp_mappings = require "mappings/plugins/lsp"
local debug_mappings = require "mappings/plugins/dap"

local mappings =
    vim.tbl_deep_extend(
      "force",
      nvim_tree_mappings,
      vim_test_mappings,
      lsp_mappings,
      telesecope_mappings,
      neogit_mappings,
      debug_mappings
    )

return mappings
