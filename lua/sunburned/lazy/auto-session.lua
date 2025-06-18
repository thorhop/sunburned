--function RestoreNeoTree()
--    local neotree = require('neo-tree')
--    neotree.dir({vim.fn.getcwd()})
--    neotree.toggle()
--end

return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "error",
      --pre_save_cmds = { 'Neotree close' },
      --post_restore_cmds = { 'Neotree filesystem show' },
      --neotree_cmds = {RestoreNeoTree()}
    }
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end
}
