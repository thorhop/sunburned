return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')
    lualine.setup{
      extensions = {'fugitive','fzf','lazy','mason','neo-tree','quickfix','toggleterm','trouble'},
      options = {
        theme = 'auto',
        globalstatus = true,
        disabled_filetypes = {'md'};
      },
      sections = {lualine_c = {require('auto-session.lib').current_session_name}},
    }
  end
}
