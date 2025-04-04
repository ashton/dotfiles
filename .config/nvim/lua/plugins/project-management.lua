return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      exclude_dirs = { "~", "~/.cargo/*", }
    },
    keys = {
      { "<leader>pp", "<cmd>Telescope projects<CR>", desc = "List recent projects" }
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end
  }
}
