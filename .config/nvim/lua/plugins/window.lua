return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bd", "<Cmd>lua require'mini.bufremove'.delete()<CR>", desc = "Delete current buffer" }
    }
  },
  {
    "yorickpeterse/nvim-window",
    lazy = true,
    config = true,
    keys = {
      { "gw", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Pick Window" }
    },
  },
  {
    "sindrets/winshift.nvim",
    lazy = true,
    config = true,
    keys = {
      { "<leader>wc", "<cmd>WinShift<CR>", desc = "Activate window mode to rearrange windows" }
    }
  }
}
