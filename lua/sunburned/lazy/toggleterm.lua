function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
return {
  'akinsho/toggleterm.nvim',
  config = function()
    local toggleterm = require('toggleterm')
    toggleterm.setup{
      hidenumbers = true,
      shade_terminals = false,
      insert_mappings = true,
      autochdir = false,
      terminal_mappings = true,
      open_mapping = [[<c-\>]],
    }
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
