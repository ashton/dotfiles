local leader_mappings = {
  t = {
    name = "+test",
    n = {"<cmd>TestNearest<CR>", "test nearest"},
    f = {"<cmd>TestFile<CR>", "test file"},
    s = {"<cmd>TestSuite<CR>", "test suite"},
    l = {"<cmd>TestLast<CR>", "test last"}
  }
}

return {["<leader>"] = leader_mappings}
