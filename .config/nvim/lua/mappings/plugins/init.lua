require "mappings/plugins/compe"
local utils = require "utils"

local nvim_tree_mappings = require "mappings/plugins/nvim-tree"
local vim_test_mappings = require "mappings/plugins/vim-test"
local barbar_mappings = require "mappings/plugins/barbar"
local telesecope_mappings = require "mappings/plugins/telescope"
local neogit_mappings = require "mappings/plugins/neogit"
local lsp_saga_mappings = require "mappings/plugins/lsp-saga"
local debug_mappings = require "mappings/plugins/dap"

local mappings =
  utils.merge_tables(
  nvim_tree_mappings,
  vim_test_mappings,
  barbar_mappings,
  lsp_saga_mappings,
  telesecope_mappings,
  neogit_mappings,
  debug_mappings
)

return mappings
