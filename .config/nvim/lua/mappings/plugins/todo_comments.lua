local leader_mappings = {
  p = {
    name = "+project",
    t = { "<cmd>TodoTrouble<CR>", "list project tasks" }
  }
}

local goto_mappings = {
  name = "+goto",
  T = { "<cmd>TodoTrouble<CR>", "goto tasks" }
}

local next_mappings = {
  name = "+next",
  T = { function()
    require("todo-comments").jump_next()
  end, "next task" }
}

local previous_mappings = {
  name = "+previous",
  T = { function()
    require("todo-comments").jump_prev()
  end, "previous task" }
}

return {
  ["<leader>"] = leader_mappings,
  ["g"] = goto_mappings,
  ["["] = previous_mappings,
  ["]"] = next_mappings
}
