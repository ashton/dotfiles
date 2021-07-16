local leader_mappings = {
  t = {
    name = '+test',
    n = {':TestNearest<CR>', 'test nearest'},
    f = {':TestFile<CR>', 'test file'},
    s = {':TestSuite<CR>', 'test suite'},
    l = {':TestLast<CR>', 'test last'},
  }
}

return {['leader'] = leader_mappings}
