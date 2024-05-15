return {
  ensure_installed = { "elixir-ls", "js-debug-adapter" },
  automatic_installation = true,
  handlers = {
    function(config)
      local mason_dap = require("mason-nvim-dap")
      -- all sources with no handler get passed here

      -- Keep original functionality
      mason_dap.default_setup(config)
    end,
    ["js-debug-adapter"] = function(config)
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.exepath("js-debug-adapter"),
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      })
      config.configurations = {

      }
    end
  }

}
