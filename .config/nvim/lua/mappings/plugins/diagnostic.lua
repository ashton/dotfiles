local leader_mappings = {
  c = {
    x = {
      b = { "<Cmd>TroubleToggle document_diagnostics<CR>", "buffer diagnostics" },
      f = { "<Cmd>TroubleToggle quickfix<CR>", "quickfix list" },
      l = { function() vim.diagnostic.open_float(0, { scope = 'line' }) end, "line diagnostics" },
      p = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "project diagnostics" },
    }
  }
}

local next_mappings = {
  name = "+next",
  e = {
    function()
      vim.diagnostic.goto_next()
    end,
    "next diagnostic"
  }
}

local prev_mappings = {
  name = "+previous",
  e = {
    function()
      vim.diagnostic.goto_prev()
    end,
    "previous diagnostic"
  }
}
return {
  ["<leader>"] = leader_mappings,
  ["["] = prev_mappings,
  ["]"] = next_mappings,
}
