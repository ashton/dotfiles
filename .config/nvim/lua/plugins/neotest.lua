return function(_plugin, opts)
  require("neotest").setup(vim.tbl_deep_extend("force", opts, {
    adapters = {
      require "neotest-vitest",
      require "neotest-elixir",
      require "neotest-rust",
    },
    icons = {
      failed = "󰅙",
      passed = "󰗠",
      running = "",
      running_animated = { "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" },
      skipped = "󱧧",
      unknown = "󰋗",
      watching = "󰈈"
    },
    diagnostic = {
      enabled = false
    },
    jump = {
      enabled = true
    },
    output = {
      open_on_run = false,
      close_mapping = "q"
    },
    output_panel = {
      enabled = true
    },
    summary = {
      mappings = {
        expand = "<Tab><Tab>",
        jumpto = "<Enter>",
        run = "r",
        stop = "s",
        run_marked = { "R", "<S-Enter>" },
        clear_marked = "xm",
        clear_target = "xt",
        next_failed = "<Tab>",
        prev_failed = "<S-Tab>",
        watch = "W",
        open = function()
          local cmd = "botright vsplit | vertical resize 50"
        end
      }
    }
  }))
end
