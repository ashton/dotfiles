local autocmd = vim.api.nvim_create_autocmd

local function augroup(name, fn)
  fn(vim.api.nvim_create_augroup(name, { clear = true }))
end

augroup("custom-nvim-cool/ToggleSearchHighlight", function(group)
  autocmd("InsertEnter", {
    group = group,
    callback = function()
      vim.schedule(function()
        vim.cmd("nohlsearch")
      end)
    end
  })

  autocmd("CursorMoved", {
    group = group,
    callback = function()
      -- No bloat lua adaptation of: https://github.com/romainl/vim-cool
      local view, rpos = vim.fn.winsaveview(), vim.fn.getpos(".")
      -- Move the cursorto a position where (hwereas in active search) pressing  `n`
      -- brings us to the original cursor position, in a forward search / that means
      -- one column before the match, in a backward search ? we move one col forward

      vim.cmd(string.format("silent! keepjumps go%s",
        (vim.fn.line2byte(view.lnum) + view.col + 1 - (vim.v.searchforward == 1 and 2 or 0))))

      -- Attempt to goto next match, if we're in an active search cursor position
      -- should be equal to original cursor positition
      local ok, _ = pcall(vim.cmd, "silent! keepjumps norm! n")
      local insearch = ok and (function()
        local npos = vim.fn.getpos(".")
        return npos[2] == rpos[2] and npos[3] == rpos[3]
      end)()

      -- Restore original view and position
      vim.fn.winrestview(view)
      if not insearch then
        vim.schedule(function()
          vim.cmd("nohlsearch")
        end)
      end
    end
  })
end)
