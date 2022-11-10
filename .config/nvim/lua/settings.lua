local g = vim.g
local cmd = vim.cmd
local o, wo, bo, opt= vim.o, vim.wo, vim.bo, vim.opt

vim.cmd('syntax on')
vim.cmd('colorscheme dracula')

o.showmode=false
o.foldlevelstart=99
o.backupcopy='yes'
o.autoread=true
o.textwidth=0
o.wrapmargin=0
o.colorcolumn='+1'
o.encoding='utf-8'
o.tabstop=2
o.shiftwidth=2
o.expandtab=true
o.list=true
o.swapfile=false
o.completeopt='noinsert,noselect'
o.hlsearch=true
o.ignorecase=true
o.smartcase=true
o.mouse='a'
o.relativenumber=true
o.updatetime=300
o.cmdheight=2
o.shortmess='c'
o.signcolumn='yes'

wo.wrap=false

opt.listchars={tab = '▸\\' , eol = '¬', trail = '.', extends = '>', precedes = '<'}
