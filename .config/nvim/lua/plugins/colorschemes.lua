return {
  {
    "luisiacc/gruvbox-baby",
    lazy = false,
    priority = 1000,
  },
  {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    opts = { mirage = true },
    config = function(_, opts)
      require('ayu').setup(opts)
    end
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
    end
  },
  {
    "custom/my-theme",
    dependencies = {
      "luisiacc/gruvbox-baby",
      "savq/melange-nvim",
      "Shatur/neovim-ayu",
      "AlexvZyl/nordic.nvim"
    },
    dev = true
  }
}
