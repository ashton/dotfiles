local M = {}

function M.get_opts()
  local config = require("my-lualine.config")
  local components = require("my-lualine.components")
  return config.setup({
    components = {
      left = {
        components.initial_separator(),
        components.devil_logo(),
        components.mode_symbol(),
        "my_fancy_cwd",
        components.location(),
        components.mid_section(),
        components.lsp_diagnostics(),
        "my_lsp_status"
      },
      right = {
        components.git_branch(),
        components.git_diff(),
        { "my_macro" },
        { "my_scroll", reverse = true }
      },
      top = {
        {
          "filetype",
          colored = true,
          icon_only = true,
          icon = { align = "left" },
          separator = "❱"
        },
        { "filename", symbols = { modified = "", readonly = "󰌾", unnamed = "", newfile = "" } }
      },
      title = { { "navic" }, components.signature_helper() }
    }
  })
end

function M.get_config()
  return function(_, opts)
    local lualine = require("lualine")

    lualine.setup(opts)
  end
end

return M
