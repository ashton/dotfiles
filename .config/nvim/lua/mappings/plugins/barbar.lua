local leader_mappings = {
  b = {
    ['name'] = '+buffers',
    ['1'] = {':BufferGoto 1<CR>', 'go to buffer 1'},
    ['2'] = {':BufferGoto 2<CR>', 'go to buffer 2'},
    ['3'] = {':BufferGoto 3<CR>', 'go to buffer 3'},
    ['4'] = {':BufferGoto 4<CR>', 'go to buffer 4'},
    ['5'] = {':BufferGoto 5<CR>', 'go to buffer 5'},
    ['6'] = {':BufferGoto 6<CR>', 'go to buffer 6'},
    ['7'] = {':BufferGoto 7<CR>', 'go to buffer 7'},
    ['8'] = {':BufferGoto 8<CR>', 'go to buffer 8'},
    ['9'] = {':BufferGoto 9<CR>', 'go to buffer 9'},
    ['0'] = {':BufferGoto 10<CR>', 'go to buffer 10'},
    ['d'] = {':BufferClose<CR>', 'close buffer'},
    ['o'] = {':BufferCloseAllButCurrent<CR>', 'close all but this buffer'},
  }
}

local next_mappings = {
    name = '+next',
    b = {':BufferNext<CR>', 'next buffer'},
}

local previous_mappings = {
    name = '+previous',
    b = {':BufferPrevious<CR>', 'previous buffer'},
}

return {
  ['leader'] = leader_mappings,
  ['['] = previous_mappings,
  [']'] = next_mappings
}
