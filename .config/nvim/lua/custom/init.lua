local o, opt, g, wo, bo = vim.o, vim.opt, vim.g, vim.wo, vim.bo

g.mapleader = ","

opt.colorcolumn = "120"
opt.listchars = { tab = "▸\\", eol = "¬", trail = ".", extends = ">", precedes = "<" }

o.autoread = true
o.encoding = "utf-8"
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.list = true
o.swapfile = false
o.completeopt = "menu,menuone,noselect"
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.relativenumber = true
o.updatetime = 300
o.cmdheight = 2
o.shortmess = "c"
o.signcolumn = "yes"
o.showbreak = "↳"
o.breakindent = true
o.breakindentopt = "min:20,shift:2"
o.whichwrap = "<,>,h,l,[,]"
o.backupcopy = "no"

wo.wrap = true
wo.linebreak = true

bo.formatoptions = "tcqr"

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.templ", command = "set ft=templ" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.hcl", command = "set ft=hcl" })
