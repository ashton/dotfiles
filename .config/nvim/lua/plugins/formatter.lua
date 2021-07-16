local formatter = require 'formatter'

formatter.setup {
  filetype = {
    javascript = {
      function()
        return {
          exe = 'prettier',
          args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0), '--single-quote'},
          stdin = true
        }
      end
    },

    elm = {
      function ()
        return {
          exe = 'elm-format',
          args = {'--stdin', '--yes'},
          stdin = true
        }
      end
    },

    lua = {
      function ()
        return {
          exe = 'luafmt',
          args = {'--indent-count', 2, '--stdin'},
          stdin = true
        }
      end
    }
  }
}

-- format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.elm,*.lua FormatWrite
augroup END
]], true)

