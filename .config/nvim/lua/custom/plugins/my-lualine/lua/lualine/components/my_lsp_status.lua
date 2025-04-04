local M = require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)

  self.options.icons_enabled = true
  self.options.default_icons = {
    stopped = "󱏏",
    running = "󱤵"
  }
end

function M:update_status()
  self.lsp_status = "stopped"
  local result = "No LSP clients"

  local buf_nr = vim.api.nvim_get_current_buf()
  local client = vim.lsp.get_clients({ bufnr = buf_nr })[1]

  if client ~= nil then
    self.lsp_status = "running"
    return client.name
  end

    return result
end

function M:apply_icon()
  self.options.icon = self.options.default_icons[self.lsp_status]
  M.super.apply_icon(self)
end

return M
