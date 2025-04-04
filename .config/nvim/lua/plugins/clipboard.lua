return {
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua" } },
    opts = {
      ring = {
        storage = "sqlite"
      },
      preserve_cursor_position = {
        enabled = true
      }
    },
    keys = {
      { "p",  "<Plug>(YankyGPutAfter)",  mode = { "n" } },
      { "P",  "<Plug>(YankyGPutBefore)", mode = { "n" } },
      { "y",  "<Plug>(YankyYank)",       mode = { "n", "x" } }
    }
  }
}
