return {
  {
    "FeiyouG/commander.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>:", "<cmd>lua require('commander').show()<CR>", desc = "Command Palette" },
      { "<S-D-P>",   "<cmd>lua require('commander').show()<CR>", desc = "Command Palette" }
    },
    opts = {
      prompt_title = "Command Palette",
      separator = "  ",
      components = {
        "CAT",
        "DESC",
      },

      sort_by = {
        "CAT",
        "DESC"
      },
      integration = {
        telescope = {
          enable = true,
          theme = require("telescope.themes").commander
        }
      }
    },
    config = function(_, opts)
      local commander = require("commander")
      commander.setup(opts)

      commander.add({
        { desc = "Splits current line",   cmd = "<cmd>TSJSplit<CR>" },
        { desc = "Joins current line",    cmd = "<cmd>TSJJoin<CR>" },
        { desc = "Format current buffer", cmd = "<cmd>lua vim.lsp.buf.format()<cr>" },
      }, { cat = "Editing", set = false })
    end
  }
}
