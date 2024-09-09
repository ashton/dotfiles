local function config()
  local dap = require 'dap'

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

return { config = config }
