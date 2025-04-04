return {
  -- Visible Indentations
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "·"
      },
      scope = {
        show_start = false,
        show_end = false,
        char = "┊",
      }
    },
    config = function(_, opts)
      local ibl = require("ibl")
      local hooks = require("ibl.hooks")

      ibl.setup(opts)
      hooks.register(hooks.type.ACTIVE, function(bufnr)
        return not vim.tbl_contains(
          { "dashboard" },
          vim.api.nvim_get_option_value("filetype", { buf = bufnr })
        )
      end)
    end
  },

  -- Visible TODO and other keywords comments, lists them using trouble TODO
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      merge_keywords = false,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning", alt = { "GAMB", "GAMBI", "WARN" } },
      },
    }
  },

  -- Status bar
  {
    "custom/my-lualine",
    dev = true,
    dependencies = {
      { "custom/my-theme" },
      { "ray-x/lsp_signature.nvim" }
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "custom/my-lualine",
    },
    opts = function()
      local my_config = require("my-lualine")
      return my_config.get_opts()
    end,

    config = function(_, opts)
      local config_fn = require("my-lualine").get_config()
      config_fn(_, opts)
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      theme = "doom",
      config = {
        header = {
          "                                                     ",
          "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          "                                                     ",
        },
        center = {
          {
            icon = " ",
            desc = "Config files",
            key = "c",
            action = "e ~/.config/nvim/lua"
          },
          {
            icon = " ",
            desc = "Dot files",
            key = ".",
            action = "e ~/.config/"
          },
          {
            icon = "󰈢 ",
            desc = "Find in files",
            key = "f",
            keymap = "SPC SPC",
            action = function()
              require("telescope.builtin").find_files({
                prompt_title = "Open Directory",
                cwd = "~/dev",
                find_command =
                { "fd", "--type", "d", "--max-depth", "2" }
              })
            end
          },
          {
            icon = " ",
            desc = "Plugins",
            key = "l",
            action = "Lazy"
          },
          {
            icon = " ",
            desc = "Packages",
            key = "m",
            action = "Mason"
          },
          {
            icon = "󱝭 ",
            desc = "Projects",
            key = "p",
            keymap = "SPC p p",
            action = "Telescope projects"
          },
          {
            icon = "󰩈 ",
            desc = "Exit",
            key = "q",
            action = "qall"
          }
        },
        vertical_center = true
      }
    },
    dependencies = { "nvim-telescope/telescope.nvim" }
  },

  -- Overall UI for Nvim
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      signature = {
        enabled = false
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "written" },
              { find = "yanked" },
              { find = "changes;" },
              { find = "AutoSave:" },
            }
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      plugins = {
        registers = true,
      },
      spec = require("config.key-mapping"),
    }
  }
}
