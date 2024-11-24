--function OpeningAct()
--  --vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--  vim.api.nvim_create_autocmd("VimEnter", {
--    command = 'Telescope find_files',
--  })
--end
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
  },
  config = function()
    --local actions = require("telescope.actions")
    -- Use this to add more results without clearing the trouble list
    --local add_to_trouble = require("trouble.sources.telescope").add
    require('telescope').setup({
      pickers = {
        buffers = {
          theme = "dropdown",
          previewer = false,
          sort_mru = true,
        }
      },
    })

    local builtin = require('telescope.builtin')
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open

    vim.keymap.set('n', '<leader><tab>', builtin.buffers)
    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fg', builtin.git_files)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    vim.keymap.set('n', '<leader><cr>', builtin.resume)
    vim.keymap.set('n', '<leader>fr', open_with_trouble)
    vim.keymap.set('i', '<leader>fr', open_with_trouble)
    vim.keymap.set('n', '<leader>fs', function()
        builtin.grep_string({ search = vim.fn.input('Grep > ') })
    end)
    vim.keymap.set('n', '<leader>fWs', function()
        local word = vim.fn.expand('<cWORD>')
        builtin.grep_string({ search = word })
    end)
    --OpeningAct()
  end
}
