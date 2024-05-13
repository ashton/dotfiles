local function config()
  local dap = require 'dap'

  dap.adapters.dart = {
    type = 'executable',
    command = 'dart',
    args = { 'debug_adapter' }
  }

  dap.adapters.flutter = {
    type = 'executable',
    command = 'flutter',
    args = { 'debug_adapter' }
  }

  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch dart",
      dartSdkPath = os.getenv("FLUTTER_SDK_HOME") .. "/bin/cache/dart-sdk/bin/dart",
      flutterSdkPath = os.getenv("FLUTTER_SDK_HOME") .. "/bin/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    },
    {
      type = "flutter",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = os.getenv("FLUTTER_SDK_HOME") .. "/bin/cache/dart-sdk/bin/dart",
      flutterSdkPath = os.getenv("FLUTTER_SDK_HOME") .. "/bin/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    }
  }

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
