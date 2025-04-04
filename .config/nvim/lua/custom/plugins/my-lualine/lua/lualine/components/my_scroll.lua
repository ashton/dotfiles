local scrollbar_component = require("lualine.component"):extend()

function scrollbar_component:init(opts)
  opts.reverse = opts.reverse or false
  scrollbar_component.super.init(self, opts)
end

function scrollbar_component:update_status()
  if not vim.api.nvim_buf_is_loaded(0) then
    return ''
  end

  local scroll_bar_blocks = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
  local curr_line = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_line_count(0)

  if self.options.reverse then
    return string.rep(scroll_bar_blocks[8 - math.floor(curr_line / lines * 7)], 2)
  else
    return string.rep(scroll_bar_blocks[math.floor(curr_line / lines * 7) + 1], 2)
  end
end

return scrollbar_component
