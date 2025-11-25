return {
  {
    "echasnovski/mini.ai",
    opts = function()
      local gen_spec = require("mini.ai").gen_spec

      return {
        custom_textobjects = {
          q = { { "%b\"\"", "%b''", "%b``" }, "^.().*().$" },                        -- quotes textobject
          l = { { "%b()", "%b[]", "%b{}" }, "^.().*().$" },                          --  anytyhing inside () [] or {}
          b = { { "%b{}" }, "^.().*().$" },                                          -- b is only for braces
          B = { { "%b[]" }, "^.().*().$" },                                          -- B is only for brackets
          L = { { "%b()" }, "^.().*().$" },                                          -- l is only for parenthesis
          t = { { "%b<>" }, "^.().*().$" },                                          -- t for tags
          f = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }), -- f for functions
          z = gen_spec.treesitter({ a = '@fold.outer', i = '@fold.inner' }),         -- z for folds
          a = gen_spec.argument({ brackets = "%b()", separator = "[, ]" })           -- any value inside ()'s separated by comma or blank space
        },
        mappings = {
          around_next = "agn",
          inside_next = "ign",
          around_last = "agl",
          inside_last = "igl",
        },
        goto_left = "[a",
        goto_right = "]a"
      }
    end,
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
      keymaps = {
        useDefaults = false
      }
    },
    keys = {
      { "ii", "<cmd>lua require('various-textobjs').identation('inner')<CR>",    mode = { "o", "x" }, desc = "surrounding lines with same level of identation" },
      { "ai", "<cmd>lua require('various-textobjs').identation('outer')<CR>",    mode = { "o", "x" }, desc = "surrounding lines with same level of identation" },
      { "iS", "<cmd>lua require('various-textobjs').subword('inner')<CR>",       mode = { "o", "x" }, desc = "go to next inner subword" },
      { "aS", "<cmd>lua require('various-textobjs').subword('outer')<CR>",       mode = { "o", "x" }, desc = "go to next outer subword" },
      { "iv", "<cmd>lua require('various-textobjs').value('inner')<CR>",         mode = { "o", "x" }, desc = "go to next inner value of a key-value pair" },
      { "av", "<cmd>lua require('various-textobjs').value('outer')<CR>",         mode = { "o", "x" }, desc = "go to next outer value of a key-value pair" },
      { "ik", "<cmd>lua require('various-textobjs').key('inner')<CR>",           mode = { "o", "x" }, desc = "go to next inner key of a key-value pair" },
      { "ak", "<cmd>lua require('various-textobjs').key('outer')<CR>",           mode = { "o", "x" }, desc = "go to the next , separated argument" },
      { "i,", "<cmd>lua require('various-textobjs').argument('inner')<CR>",      mode = { "o", "x" }, desc = "go to the next , separated argument including ," },
      { "a,", "<cmd>lua require('various-textobjs').argument('outer')<CR>",      mode = { "o", "x" }, desc = "go to next outer key of a key-value pair" },
      { "C",  "<cmd>lua require('various-textobjs').toNextClosingBracket()<CR>", mode = { "o", "x" }, desc = "to the next closing bracket ), ], }" },
    }
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
}
