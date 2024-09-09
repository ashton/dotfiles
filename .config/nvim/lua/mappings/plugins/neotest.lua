local leader_mappings = {
  t = {
    name = "+test",
    d = { function() require 'neotest'.run.run({ strategy = "dap" }) end, "debug nearest test" },
    f = { function() require 'neotest'.run.run(vim.fn.expand("%")) end, "run all tests in current file" },
    l = { function() require 'neotest'.run.run_last() end, "run last test" },
    o = { function() require 'neotest'.output.open({ short = true }) end, "open nearest test output in popup" },
    O = { function() require 'neotest'.output.open({ enter = true }) end,
      "open nearest test output in popup and change the focus to it" },
    p = { function() require 'neotest'.output_panel.toggle() end, "open panel with all tests output" },
    P = { function() require 'neotest'.output_panel.clear() end, "clears the panel with test's output" },
    s = { function() require 'neotest'.summary.toggle() end, "tests summary" },
    t = { function() require 'neotest'.run.run() end, "run nearest test" },
    w = { function() require 'neotest'.watch() end, "Watch tests" }
  }
}

local next_mappings = {
  f = { function() require 'neotest'.jump.next({ status = "failed" }) end, "Next failing test" }
}

local previous_mappings = {
  f = { function() require 'neotest'.jump.prev({ status = "failed" }) end, "Previous failing test" }
}

return {
  ["<leader>"] = leader_mappings,
  ["["]        = previous_mappings,
  ["]"]        = next_mappings
}
