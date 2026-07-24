vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

vim.opt_local.comments = { 'b:*', 'b:- [ ]', 'b:-', 'b:+', 'b:1.', 'nb:>' }
vim.opt_local.formatoptions:remove('c')
vim.opt_local.formatoptions:append('j')
vim.opt_local.formatoptions:append('r')
vim.opt_local.formatoptions:append('o')
