return   {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async', 'nvim-treesitter/nvim-treesitter',
  config = function()
    local nvimUfo = require('nvim-ufo').setup()
    nvimUfo.setup({
        provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
        end
    })
  end
}
