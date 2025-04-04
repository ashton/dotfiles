return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",                   -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>fe",
        "<cmd>Neotree source=filesystem toggle reveal<CR>",
        desc = "Open File Explorer",
      }
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    opts = {
      sources = {
        "filesystem"
      },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      use_default_mappings = false,
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        }
      },
      window = {
        position = 'left',
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {                         -- global NeoTree window mappings
          ["<SPACE>"] = "toggle_node",
          ["<CR>"] = "open",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
          ["l"] = "focus_preview",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["q"] = "close_window",
          ["<ESC>"] = "close_window",
          ["<leader>fe"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
        }
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        follow_current_file = { enabled = true },
        window = {
          mappings = {
            ["<BS>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["cf"] = "add",
            ["cd"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["m"] = "move",
          }
        }
      }
    }
  }
}
