local leader_mappings = {
  c = {
    r = {
      name = "+ refactorings",
      s = { "<cmd>TSJSplit<CR>", "Splits current node" },
      j = { "<cmd>TSJJoin<CR>", "Joins current node" },
    }
  }
}

return { ["<Space>"] = leader_mappings }
