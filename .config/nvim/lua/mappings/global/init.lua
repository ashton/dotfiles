local buffer_mappings = require "mappings.global.buffers"
local window_mappings = require "mappings.global.windows"


local global_mappings = {["<Tab>"] = {"<Plug>(matchup-%)", "Go to the matching pair"}}
return vim.tbl_deep_extend("force", global_mappings, buffer_mappings, window_mappings)
