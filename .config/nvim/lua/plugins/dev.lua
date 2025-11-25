return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        "neotest",
        "plenary.nvim",
        "mini.test"
      }
    }
  },
  { 'nvim-mini/mini.test', version = false, opts = {} },
}
