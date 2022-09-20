vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.wildoptions = 'pum'
vim.opt.background = 'dark'
vim.opt.winblend = 20
vim.opt.pumblend = 20

vim.cmd [[
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight LineNr ctermbg=none
  highlight Folded ctermbg=none
  highlight EndOfBuffer ctermbg=none
]]
