vim.keymap.set( {'n','c'}, '<S-ScrollWheelUp>', '<zH>')
vim.keymap.set( {'n','c'}, '<S-ScrollWheelDown>',  '<zL>')
vim.opt.guicursor = ''
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.titlestring = [[%{substitute(getcwd(),'^.*/','','')} - %t]]
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.termguicolors = true
vim.o.foldenable = true
vim.o.foldcolumn = 'auto' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.mousemoveevent = true
vim.o.background = 'light'
vim.wo.number = false
vim.wo.rnu = true
vim.wo.fillchars='eob: '
vim.g.undotree_WindowLayout = 1
