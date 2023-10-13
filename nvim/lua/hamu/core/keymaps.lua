-- set Leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap 

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', {remap = true})

keymap.set('n', '<C-a>', '<Plug>(dps-dial-increment)', {noremap = true})
keymap.set('n', '<C-x>', '<Plug>(dps-dial-decrement)', {noremap = true})
-- keymap.set('x', '<Leader>+', '<Plug>(dps-dial-increment)')
-- keymap.set('x', '<Leader>-', '<Plug>(dps-dial-decrement)')
-- xmap g<C-a> g<Plug>(dps-dial-increment)
-- xmap g<C-x> g<Plug>(dps-dial-decrement)
-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})
