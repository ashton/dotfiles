local buffer_mappings = {
  ["<leader>"] ={
    b = {
      name = "+buffers",
      d = {"<cmd>bd<CR>", "close current buffer"},
      n = {"<cmd>bnext<CR>", "next buffer"},
      p = {"<cmd>bprevious<CR>", "previous buffer"},
      L = {"<cmd>blast<CR>", "last buffer in order"},
      f = {"<cmd>bfirst<CR>", "first buffer in order"},
      l = {"<cmd>b#<CR>", "last buffer used"},
    }
  }
}

return buffer_mappings
