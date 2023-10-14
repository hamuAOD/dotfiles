-- set Leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', {remap = true})

keymap.set('n', '<C-a>', '<Plug>(dps-dial-increment)', {noremap = true})
keymap.set('n', '<C-x>', '<Plug>(dps-dial-decrement)', {noremap = true})
keymap.set('x', '<C-a>', '<Plug>(dps-dial-increment)', {noremap = true})
keymap.set('x', '<C-x>', '<Plug>(dps-dial-decrement)', {noremap = true})
-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})

-- set expandtab をトグル
keymap.set('n', '<leader>se', ':set expandtab!<CR>', {desc = "Toggle EXPANDTAB" }, {noremap = true})
-- set list をトグル
keymap.set('n', '<Leader>sl', ':set list!<CR>', {desc = "Toggle LIST" }, {noremap = true})
-- ノーマルモードでもエンターキーで改行を挿入
keymap.set('n', '<CR>', 'o<ESC>', {noremap = true})
