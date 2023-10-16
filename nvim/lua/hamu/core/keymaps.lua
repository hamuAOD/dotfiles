-- set Leader key to space
vim.g.mapleader = " "
local NS = { noremap = true, silent = true }

local keymap = vim.keymap

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', {remap = true})

keymap.set('n', '<C-a>', '<Plug>(dps-dial-increment)', NS)
keymap.set('n', '<C-x>', '<Plug>(dps-dial-decrement)', NS)
keymap.set('x', '<C-a>', '<Plug>(dps-dial-increment)', NS)
keymap.set('x', '<C-x>', '<Plug>(dps-dial-decrement)', NS)
-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})

-- set expandtab をトグル
keymap.set('n', '<Leader>se', ':set expandtab!<CR>', {desc = "Toggle EXPANDTAB" }, NS)
-- set list をトグル
keymap.set('n', '<Leader>sl', ':set list!<CR>', {desc = "Toggle LIST" }, NS)
-- ノーマルモードでもエンターキーで改行を挿入
keymap.set('n', '<CR>', 'o<ESC>', {noremap = true})

-- keymap.set('x', '<Leader>ae', '<Plug>(EasyAlign)', { desc = "vim-easy-align" }, NS)
-- keymap.set('n', '<Leader>ae', '<Plug>(EasyAlign)', { desc = "vim-easy-align" }, NS)
