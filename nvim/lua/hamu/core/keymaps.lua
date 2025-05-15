-- set Leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap
local NS = { noremap = true, silent = true }

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', NS)

-- Change Keymaps
keymap.set('n', 'Y', 'y$', NS)                -- 行末までコピー
keymap.set('n', 'U', '<c-r>', NS)             -- リドゥ
keymap.set('n', 'M', '%', NS)                 -- 括弧ジャンプ
keymap.set('x', 'M', '%', NS)                 -- 括弧ジャンプ
keymap.set('n', '<CR>', 'o<ESC>', NS)         -- 改行だけ挿入
keymap.set('n', 'gg', '0gg', NS)              -- Vim Styleの先頭へ移動
-- keymap.set('n', '*', '/<C-r><C-w><CR>N', NS)  -- 検索後にカーソルを移動しない

-- for Mac
keymap.set('n', '<D-c>', 'y', NS)
keymap.set('n', '<D-v>', 'p', NS)

-- CUEファイル用検索
keymap.set('n', '<Leader>c', '/\\( \\l\\|[^\\x01-\\x7E]\\|TITLE\\)<CR>', {desc = "Search: Check CUE"}, NS)

-- 単語の先頭を大文字に変換
keymap.set('n', '<Leader>n', [[:%s/\<\u\+\>/\=toupper(submatch(0)[0]).tolower(submatch(0)[1:])/g<CR>]], {desc = "Normalize caps (whole file)"}, NS)
keymap.set('v', '<Leader>n', [[:s/\<\u\+\>/\=toupper(submatch(0)[0]).tolower(submatch(0)[1:])/g<CR>]], {desc = "Normalize caps (visual selection)"}, NS)

-- インデント操作を連続でできるように
keymap.set('x', '<', '<gv', NS)
keymap.set('x', '>', '>gv', NS)
-- ウィンドウの幅調整
keymap.set('n', '<', '<C-w><<C-w>', NS)
keymap.set('n', '>', '<C-w>><C-w>', NS)
-- Current Directoryをファイルの場所にを変更
keymap.set('n', 'cd', '<CMD>cd %:h<CR>', {desc = "Change Current Directory"}, NS)
-- カーソル下のキーワードを置換
keymap.set('n', 'S', ':%s/\\V\\<<C-r><C-w>\\>//ge<Left><Left><Left>', {remap = true})
-- 選択したキーワードを置換
keymap.set('x', 'S', '"zy:%s/\\V<C-r><C-r>=escape(@z,\' /\\\')<CR>//ge<Left><Left><Left>', {remap = true})
-- ペースト結果のインデントを自動で揃える
keymap.set('n', 'p', ']p`]', NS)
keymap.set('n', 'P', ']P`]', NS)

-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', NS)
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', NS)

-- 画面分割
keymap.set('n', 'sh', '<CMD>split<CR><C-w>w', {desc = "Split Window Holizontal"}, NS)
keymap.set('n', 'sv', '<CMD>vsplit<CR><C-w>w', {desc = "Split Window Vertical"}, NS)
-- 画面移動
keymap.set('n', 'sn', '<C-w>w', {desc = "Next Window"}, NS)
keymap.set('n', 'sp', '<C-w><S-w>', {desc = "Previous Window"}, NS)
-- バッファ移動
keymap.set('n', '<C-p>', '<CMD>bprev<CR>', NS)    -- Buffer Previous
keymap.set('n', '<C-n>', '<CMD>bnext<CR>', NS)    -- Buffer Next
keymap.set('n', '<C-d>', '<CMD>bdelete<CR>', NS)  -- Buffer Delete

-- set expandtab をトグル
keymap.set('n', '<Leader>te', '<CMD>set expandtab!<CR>', {desc = "Toggle EXPANDTAB"}, NS)
-- set list をトグル
keymap.set('n', '<Leader>tl', '<CMD>set list!<CR>', {desc = "Toggle LIST"}, NS)
-- set wrap をトグル
keymap.set('n', '<Leader>tw', '<CMD>set wrap!<CR>', {desc = "Toggle WRAP"}, NS)
-- カーソル位置強調表示のトグル
keymap.set('n', '<Leader>tc', '<CMD>setlocal cursorline! cursorcolumn!<CR>', {desc = "Toggle Cursor"}, NS)
-- スペルチェック
keymap.set('n', '<Leader>ts', '<CMD>set spell!<CR>', {desc = "Toggle Spell-Check"}, NS)

-- 空行での編集開始時に自動でインデント
keymap.set('n', 'i', "v:lua.empty_line_insert()", { expr = true })
keymap.set('n', 'A', "v:lua.empty_line_append()", { expr = true })

function _G.empty_line_insert()
  return vim.fn.empty(vim.fn.getline('.')) == 1 and '"_cc' or 'i'
end

function _G.empty_line_append()
  return vim.fn.empty(vim.fn.getline('.')) == 1 and '"_cc' or 'A'
end
-- nnoremap <expr> i empty(getline('.')) ? '"_cc' : 'i'
-- nnoremap <expr> A empty(getline('.')) ? '"_cc' : 'A'

-- JSON formatter : brew install jq
vim.api.nvim_create_autocmd("FileType", {
pattern = "json",
callback = function()
  vim.keymap.set("n", '<Leader>j', [[:%!jq '.'<CR>]], {desc = "format JSON"}, NS)
end,
})
vim.keymap.set('x', '<Leader>j', [[:'<,'>!jq .<CR>]], {desc = "format selected JSON"}, NS)

-- カーソルの直前の単語を大文字にする
keymap.set("i", "<C-u>",
  function()
    local line = vim.fn.getline(".")
    local col = vim.fn.getpos(".")[3]
    local substring = line:sub(1, col - 1)
    local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
    return "<C-w>" .. result:upper()
  end,
  {expr = true}
)
--- カーソルの直前の単語の先頭を大文字にする
keymap.set('i', '<C-o>', '<ESC>bgUlgi', NS)

