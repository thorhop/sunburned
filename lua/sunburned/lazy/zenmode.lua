return {
  'folke/zen-mode.nvim',
  config = function()
    require('zen-mode').setup {
      window = {
        backdrop = 1.0,
        width = 80,
        options = {
          number = false,
          cursorcolumn = false,
          relativenumber = false,
          foldcolumn = "1",
        }
      },
      plugins = {
        options = {
          enabled = true,
          ruler = true,
          showcmd = false,
          laststatus = 0,
        },
      },
      on_open = function()
        vim.opt.wrap = true
        vim.wo.number = false
        vim.wo.rnu = false
        vim.wo.foldcolumn = "3"
        vim.api.nvim_set_hl(0, "FoldColumn", { ctermbg=0,ctermfg=0 })
        vim.api.nvim_set_hl(0, "SignColumn", { ctermbg=0,ctermfg=0 })
        --require('lualine').hide()
        vim.keymap.set('n', '<Down>', 'gj')
        vim.keymap.set('n', '<Up>', 'gk')
      end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function()
        vim.opt.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
        vim.wo.foldcolumn = "2"
        vim.api.nvim_set_hl(0, "FoldColumn", { })
        vim.api.nvim_set_hl(0, "SignColumn", { })
        --require('lualine').hide({ unhide = true })
        vim.keymap.set('n', '<Down>', '<Down>')
        vim.keymap.set('n', '<Up>', '<Up>')
      end,
    }
    vim.keymap.set('n', '<leader>zz', function()
        require('zen-mode').toggle()
    end)
  end,
}
