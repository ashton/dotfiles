return {
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
