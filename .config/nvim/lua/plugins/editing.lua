return {
  { 'echasnovski/mini.surround', version = '*', config = true },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = true
  },
  {
    "Wansmer/treesj",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    lazy = true,
    keys = {
      { "<leader>crj", "<cmd>TSJJoin<CR>",   desc = "Join lines with TS context" },
      { "<leader>crs", "<cmd>TSJSplit<CR>",  desc = "Split current line with TS context" },
      { "|",           "<cmd>TSJToggle<CR>", desc = "split if oneline, join if multiline" }
    },
    opts = {
      use_default_keymaps = false
    }
  }
}
