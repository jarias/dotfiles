local bo, wo, o, opt, g = vim.bo, vim.wo, vim.o, vim.opt, vim.g

vim.cmd('syntax on')
vim.cmd('colorscheme dracula')

o.showmode = false
o.foldlevelstart = 99
o.backupcopy = 'yes'
o.autoread = true
o.textwidth = 0
o.colorcolumn = '+1'
o.encoding = 'utf-8'
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.list = true
o.swapfile = false
o.completeopt = 'menu,menuone,noselect'
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.mouse = 'a'
o.relativenumber = true
o.updatetime = 300
o.cmdheight = 2
o.shortmess = 'c'
o.signcolumn = 'yes'
o.showbreak = "↳"
o.breakindent = true
o.breakindentopt = "min:20,shift:2"
o.whichwrap = "<,>,h,l,[,]"
o.backupcopy = "no"

wo.wrap = true
wo.linebreak = true

opt.listchars = { tab = '▸\\', eol = '¬', trail = '.', extends = '>', precedes = '<' }

bo.formatoptions = "tcqr"

-- g.node_host_prog = vim.call("system", 'volta which neovim-node-host | tr -d "\n"')
