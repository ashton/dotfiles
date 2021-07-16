local leader_mappings = {
  ['leader'] = {':Telescope find_files <CR>', 'find file'},
  f = {
    name = '+files',
    p = {':Telescope find_files<CR>', 'find file'},
  },

  s = {
    name = '+search',
    p = {':Telescope live_grep<CR>', 'search in project'}
  },

  b = {
    name = '+buffers',
    b = {':Telescope buffers<CR>', 'list buffers'},
  }
}

return {['leader'] = leader_mappings}
