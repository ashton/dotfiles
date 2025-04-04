local function setup_adapter(name, config)
  if type(name) == "number" then
    if type(config) == "string" then
      config = require(config)
      return config
    end
  elseif config ~= false then
    local adapter = require(name)
    if type(config) == "table" and not vim.tbl_isempty(config) then
      local meta = getmetatable(adapter)
      if adapter.setup then
        adapter.setup(config)
      elseif adapter.adapter then
        adapter.adapter(config)
        adapter = adapter.adapter
      elseif meta and meta.__call then
        adapter = adapter(config)
      else
        error("Adapter " .. name .. " does not support setup")
      end
    end
    return adapter
  end
end

local function run_file()
  require("neotest").run.run(vim.fn.expand("%"))
end

local function run_all_in_root()
  require("neotest").run.run(vim.fn.getcwd())
end

local function run_nearest()
  require("neotest").run.run()
end

local function run_last()
  require("neotest").run.run_last()
end

local function stop()
  require("neotest").run.stop()
end

local function toggle_summary()
  require("neotest").summary.toggle()
end

local function show_output()
  require("neotest").output.open({ enter = true, auto_close = true })
end

local function toggle_output_panel()
  require("neotest").output_panel.toggle()
end

local function watch_current_file()
  require("neotest").watch.toggle(vim.fn.expand("%"))
end

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jfpedroza/neotest-elixir",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      {
        "mrcjkb/rustaceanvim",
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
      }
    },
    opts = {
      adapters = {
        { "neotest-elixir",      ft = { "elixir" } },
        { "neotest-vitest",      ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "rescript" } },
        { "rustaceanvim.neotest", ft = { "rust" } },
        { "neotest-jest", { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
      },
      status = { virtual_text = true },
      output = { opn_on_run = true, }
    },
    keys = {
      { "<leader>t",  "",                  desc = "+Test" },
      { "<leader>tt", run_nearest,         desc = "Run nearest test" },
      { "<leader>tf", run_file,            desc = "Run all tests in file" },
      { "<leader>tp", run_all_in_root,     desc = "Run all tests in project" },
      { "<leader>tl", run_last,            desc = "Run last test again" },
      { "<leader>tS", stop,                desc = "Stop test running" },
      { "<leader>ts", toggle_summary,      desc = "Toggle test summary" },
      { "<leader>to", show_output,         desc = "Show test output" },
      { "<leader>tO", toggle_output_panel, desc = "Toggle output panel" },
      { "<leader>tw", watch_current_file,  desc = "Toggle file watcher on current file" },
    },

    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            -- Replace newline and tab characters with space for more compact diagnostics
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      opts.consumers = opts.consumers or {}
      -- Refresh and auto close trouble after running tests
      opts.consumers.trouble = function(client)
        client.listeners.results = function(adapter_id, results, partial)
          if partial then
            return
          end
          local tree = assert(client:get_position(nil, { adapter = adapter_id }))

          local failed = 0
          for pos_id, result in pairs(results) do
            if result.status == "failed" and tree:get_key(pos_id) then
              failed = failed + 1
            end
          end
          vim.schedule(function()
            local trouble = require("trouble")
            if trouble.is_open() then
              trouble.refresh()
              if failed == 0 then
                trouble.close()
              end
            end
          end)
          return {}
        end
      end

      if opts.adapters then
        local configured_adapters = {}
        for name, config in pairs(opts.adapters or {}) do
          local configured = setup_adapter(name, config)
          configured_adapters[#configured_adapters + 1] = configured
        end
        opts.adapters = configured_adapters
      end

      require("neotest").setup(opts)
    end
  }
}
