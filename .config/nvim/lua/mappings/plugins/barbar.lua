local leader_mappings = {
  b = {
    ["name"] = "+buffers",
    ["1"] = {"<cmd>BufferGoto 1<CR>", "go to buffer 1"},
    ["2"] = {"<cmd>BufferGoto 2<CR>", "go to buffer 2"},
    ["3"] = {"<cmd>BufferGoto 3<CR>", "go to buffer 3"},
    ["4"] = {"<cmd>BufferGoto 4<CR>", "go to buffer 4"},
    ["5"] = {"<cmd>BufferGoto 5<CR>", "go to buffer 5"},
    ["6"] = {"<cmd>BufferGoto 6<CR>", "go to buffer 6"},
    ["7"] = {"<cmd>BufferGoto 7<CR>", "go to buffer 7"},
    ["8"] = {"<cmd>BufferGoto 8<CR>", "go to buffer 8"},
    ["9"] = {"<cmd>BufferGoto 9<CR>", "go to buffer 9"},
    ["0"] = {"<cmd>BufferGoto 10<CR>", "go to buffer 10"},
    ["d"] = {"<cmd>BufferClose<CR>", "close buffer"},
    ["o"] = {"<cmd>BufferCloseAllButCurrent<CR>", "close all but this buffer"}
  }
}

local next_mappings = {
  name = "+next",
  b = {"<cmd>BufferNext<CR>", "next buffer"}
}

local previous_mappings = {
  name = "+previous",
  b = {"<cmd>BufferPrevious<CR>", "previous buffer"}
}

return {
  ["<leader>"] = leader_mappings,
  ["["] = previous_mappings,
  ["]"] = next_mappings
}
