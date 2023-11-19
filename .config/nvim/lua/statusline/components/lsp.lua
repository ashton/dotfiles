local lsp_server_component = require("lualine.component"):extend()

function lsp_server_component:init(options)
  options.running_icon = options.running_icon or '󱤵 '
  options.stopped_icon = options.stopped_icon or '󱏏'
  options.color = options.color or { fg = '#ffffff', gui = 'bold' }

  lsp_server_component.super.init(self, options)
end

function lsp_server_component:update_status()
    local msg = '--'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
end

function lsp_server_component:apply_icon()
  local icon = self.status == "--" and self.options.stopped_icon or self.options.running_icon
  self.status = icon .. ' ' .. self.status
end

return lsp_server_component
