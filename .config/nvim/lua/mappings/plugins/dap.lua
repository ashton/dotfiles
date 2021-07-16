local leader_mappings = {
  d = {
    name = '+debug',
    b = {[[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], 'toggle breakpoint'},
    d = {[[<Cmd>lua require'dap'.continue()<CR>]], 'start / continue'},
    e = {[[<Cmd>lua require'dapui'.eval()<CR>]], 'eval expression'},
    i = {[[<Cmd>lua require'dap'.step_into()<CR>]], 'step into'},
    o = {[[<Cmd>lua require'dap'.step_over()<CR>]], 'step over'},
    r = {[[<Cmd>lua require'dap'.repl.open()<CR>]], 'debug REPL'},
    u = {[[<Cmd>lua require'dapui'.toggle()<CR>]], 'toggle UI'}
  }
}

return {['leader'] = leader_mappings}
