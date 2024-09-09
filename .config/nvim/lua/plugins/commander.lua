local function config()
  local commander = require("commander")
  commander.setup {
    components = {
      "KEYS",
      "DESC",
      "CAT",
    },
    separator = "▎",
    integration = {
      telescope = {
        enabled = true,
        theme = require('telescope.themes').get_ivy
      },
      lazy = {
        enable = true
      }
    }
  }

  commander.add({
    {
      desc = "View installed packages",
      cmd = "<cmd>Lazy<cr>",
    },
    {
      desc = "View installed LSPs / Linters / Debbuggers",
      cmd = "<cmd>Mason<cr>"
    },
    {
      desc = "Enable Noice",
      cmd = "<cmd>Noice enable<cr>"
    },
    {
      desc = "Disable Noice",
      cmd = "<cmd>Noice disable<cr>"
    },
    {
      desc = "Disable Noice",
      cmd = "<cmd>Noice disable<cr>"
    },
    {
      desc = "TODOs",
      cmd = "<cmd>TodoQuickfixList<cr>"
    }
  }, { cat = "global" })
  commander.add({
    {
      desc = "Inspect highlights / extmarks at point",
      cmd = "<cmd>Inspect<cr>"
    },
    {
      desc = "Inspect current Treesitter tree",
      cmd = "<cmd>InspectTree<cr>"
    },
  }, { cat = "debug" })
  commander.add({
    {
      desc = "Workspace symbols",
      cmd = "<cmd>Telescope workspace_symbols<cr>"
    },
    {
      desc = "Buffer symbols",
      cmd = "<cmd>Telescope document_symbols<cr>"
    },
    {
      desc = "Format buffer",
      cmd = "<cmd>LspZeroFormat<cr>"
    },
    {
      desc = "Buffer diagnostics",
      cmd = "<cmd>Trouble document_diagnostics<cr>"
    },
    {
      desc = "Project diagnostics",
      cmd = "<cmd>Trouble workspace_diagnostics<cr>"
    },
    {
      desc = "Expand diagnostics",
      cmd = "<cmd>lua vim.diagnostic.open_float({scope = 'line'})"
    },
    {
      desc = "Restart LSP",
      cmd = "<cmd>LspRestart<cr>"
    }
  }, { cat = "Code / LSP" })

  commander.add({
    {
      desc = "Test summary",
      cmd = "<cmd>lua require'neotest'.summary.open()<cr>"
    },
    {
      desc = "Run all tests in file",
      cmd = "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>"
    },
    {
      desc = "Run test at cursor",
      cmd = "<cmd>lua require'neotest'.run.run()<cr>"
    },
    {
      desc = "Run last test",
      cmd = "<cmd>lua require'neotest'.run.run_last()<cr>"
    },
    {
      desc = "Open test output",
      cmd = "<cmd>lua require'neotest'.output.open()<cr>"
    },
    {
      desc = "Test output panel",
      cmd = "<cmd>lua require'neotest'.output_panel.toggle()<cr>"
    },
    {
      desc = "Clear test output panel",
      cmd = "<cmd>lua require'neotest'.output_panel.clear()<cr>"
    },
    {
      desc = "Watch tests",
      cmd = "<cmd>lua require'neotest'.watch()<cr>"
    },

  }, { cat = "Tests" })
end
return { config = config }
