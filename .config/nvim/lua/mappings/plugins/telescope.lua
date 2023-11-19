local leader_mappings = {
  ["<space>"] = { "<cmd>Telescope find_files<CR>", "find file" },
  f = {
    name = "+files",
    p = { "<cmd>Telescope find_files<CR>", "find file" }
  },
  s = {
    name = "+search",
    p = { "<cmd>Telescope live_grep<CR>", "search in project" }
  },
  b = {
    name = "+buffers",
    b = { "<cmd>Telescope buffers<CR>", "list buffers" }
  }
}

return { ["<leader>"] = leader_mappings }
