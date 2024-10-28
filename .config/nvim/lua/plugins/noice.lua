return {
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      }, -- removing messages when a file is saved
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "yanked",
      }, -- removing messages when yanking text
      opts = { skip = true }
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "changes;",
      }, -- removing messages when reverting changes
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "AutoSave:",
      }, -- removing messages when auto saving
      opts = { skip = true },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true
    },
    signature = {
      enabled = false
    }
  },
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false        -- add a border to hover docs and signature help
  }
}
