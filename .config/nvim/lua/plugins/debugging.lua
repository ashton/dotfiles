return {
  { "LiadOz/nvim-dap-repl-highlights", opts = {} },
  { "theHamsta/nvim-dap-virtual-text", opts = { commented = true } },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
    opts = {}
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" }
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.elixir = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/lsp_servers/elixir/elixir-ls/debugger.sh",
        args = {}
      }

      dap.configurations.elixir = {
        type = "mix_task",
        name = "mix test",
        task = "test",
        taskArgs = { "--trace" },
        projectDir = "${workspaceFolder}",
        requireFiles = {
          "test/**/test_helper.exs",
          "test/**/*_test.exs"
        }
      }
    end
  },
}
