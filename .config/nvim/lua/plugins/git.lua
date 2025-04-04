return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
    }
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    opts = {
      graph_style = "unicode",
      integrations = {
        telescope = true,
        diffview = true
      }
    },
    keys = {
      {"<leader>gg", "<cmd>Neogit<CR>", desc = "Open git dashboard"}
    }
  }
}
