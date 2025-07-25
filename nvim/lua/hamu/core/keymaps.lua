-- set Leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap
local NS = { noremap = true, silent = true }

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', '<CMD>nohlsearch<CR>', NS)

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
keymap.set('n', '<Leader>cc', '/\\( \\l\\|[^\\x01-\\x7E]\\|TITLE\\)<CR>', {desc = "Search: Check CUE", noremap = true, silent = true})
-- 単語の先頭を大文字に変換
keymap.set('n', '<Leader>cn', [[:%s/\<\w\+\>/\=toupper(submatch(0)[0]).tolower(submatch(0)[1:])/g<CR><CMD>nohlsearch<CR>]], {desc = "Normalize caps", noremap = true, silent = true})  -- whole file
keymap.set('v', '<Leader>cn', [[:s/\<\w\+\>/\=toupper(submatch(0)[0]).tolower(submatch(0)[1:])/g<CR><CMD>nohlsearch<CR>]], {desc = "Normalize caps", noremap = true, silent = true})   -- visual selection
--- カーソルの直前の単語の先頭を大文字にする
keymap.set('i', '<C-y>', '<Nop>', { noremap = true })
keymap.set('i', '<C-y>', '<ESC>bguwgUlgi', NS)
--- カーソルの直前の単語を全てを大文字にする
keymap.set('i', '<C-o>', '<Nop>', { noremap = true })
keymap.set('i', '<C-o>', '<ESC>bveUgi', NS)

-- インデント操作を連続でできるように
keymap.set('x', '<', '<gv', NS)
keymap.set('x', '>', '>gv', NS)
-- ウィンドウの幅調整
keymap.set('n', '<', '<C-w><<C-w>', NS)
keymap.set('n', '>', '<C-w>><C-w>', NS)
-- Current Directoryをファイルの場所にを変更
keymap.set('n', 'cd', '<CMD>cd %:h<CR>', {desc = "Change Current Directory", noremap = true, silent = true})
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

-- 画面分割s
keymap.set('n', '<Leader>pS', '<CMD>split<CR><C-w>w', {desc = "Split Window Holizontal", noremap = true, silent = true})
keymap.set('n', '<Leader>ps', '<CMD>vsplit<CR><C-w>w', {desc = "Split Window Vertical", noremap = true, silent = true})
-- 画面移動
keymap.set('n', '<Leader>pn', '<C-w>w', {desc = "Next Pane", noremap = true, silent = true})
keymap.set('n', '<Leader>pp', '<C-w><S-w>', {desc = "Previous Pane", noremap = true, silent = true})
-- バッファ移動
keymap.set('n', '<C-p>', '<CMD>bprev<CR>', NS)    -- Buffer Previous
keymap.set('n', '<C-n>', '<CMD>bnext<CR>', NS)    -- Buffer Next
keymap.set('n', '<C-d>', '<CMD>bdelete<CR>', NS)  -- Buffer Delete

-- fold
keymap.set('n', 'zj', 'za', {desc = "Toggle fold under cursor", noremap = true, silent = true})
keymap.set('n', 'zJ', 'zA', {desc = "Toggle all folds under cursor", noremap = true, silent = true})

function ToggleFoldLevel(level)
  local hasClosed = false

  -- まず level に一致する閉じている fold があるか調べる
  for lnum = 1, vim.fn.line("$") do
    if vim.fn.foldlevel(lnum) == level and vim.fn.foldclosed(lnum) ~= -1 then
      hasClosed = true
      break
    end
  end

  if hasClosed then
    -- 閉じている fold がある → level だけ開く
    for lnum = 1, vim.fn.line("$") do
      if vim.fn.foldlevel(lnum) == level and vim.fn.foldclosed(lnum) ~= -1 then
        vim.cmd(lnum .. "foldopen")
      end
    end
  else
    -- すべて開いている → foldlevel を下げて「表示」だけ制限（閉じたように見せる）
    vim.cmd("setlocal foldlevel=" .. (level - 1))
  end
end

vim.api.nvim_create_user_command("ToggleFoldLevel1", function() ToggleFoldLevel(1) end, {})
vim.api.nvim_create_user_command("ToggleFoldLevel2", function() ToggleFoldLevel(2) end, {})
vim.api.nvim_create_user_command("ToggleFoldLevel3", function() ToggleFoldLevel(3) end, {})
vim.api.nvim_create_user_command("ToggleFoldLevel4", function() ToggleFoldLevel(4) end, {})
vim.api.nvim_create_user_command("ToggleFoldLevel5", function() ToggleFoldLevel(5) end, {})

vim.keymap.set("n", "<Leader>tfu", ":ToggleFoldLevel1<CR>", {desc = "Toggle Fold Level1", noremap = true, silent = true})
vim.keymap.set("n", "<Leader>tfi", ":ToggleFoldLevel2<CR>", {desc = "Toggle Fold Level2", noremap = true, silent = true})
vim.keymap.set("n", "<Leader>tfo", ":ToggleFoldLevel3<CR>", {desc = "Toggle Fold Level3", noremap = true, silent = true})
vim.keymap.set("n", "<Leader>tfp", ":ToggleFoldLevel4<CR>", {desc = "Toggle Fold Level4", noremap = true, silent = true})
vim.keymap.set("n", "<Leader>tf[", ":ToggleFoldLevel5<CR>", {desc = "Toggle Fold Level5", noremap = true, silent = true})

-- set expandtab をトグル
keymap.set('n', '<Leader>te', '<CMD>set expandtab!<CR>', {desc = "Toggle EXPANDTAB", noremap = true, silent = true})
-- set list をトグル
keymap.set('n', '<Leader>tl', '<CMD>set list!<CR>', {desc = "Toggle LIST", noremap = true, silent = true})
-- set wrap をトグル
keymap.set('n', '<Leader>tw', '<CMD>set wrap!<CR>', {desc = "Toggle WRAP", noremap = true, silent = true})
-- カーソル位置強調表示のトグル
keymap.set('n', '<Leader>tc', '<CMD>setlocal cursorline! cursorcolumn!<CR>', {desc = "Toggle Cursor", noremap = true, silent = true})
-- スペルチェック
keymap.set('n', '<Leader>ts', '<CMD>set spell!<CR>', {desc = "Toggle Spell-Check"})

-- 空行での編集開始時に自動でインデント
keymap.set('n', 'i', "v:lua.empty_line_insert()", { expr = true })
keymap.set('n', 'A', "v:lua.empty_line_append()", { expr = true })

keymap.set('v', '<Leader>sl', [[:s/\r/\r/g<CR>]], { desc = "Replace CR for Mac", noremap = true, silent = true })

-- for Markdown
-- keymap.set('n', '<Leader>mc', 'V<CMD>s/\\[\\ \\]/\\[x\\]/ge<CR><ESC>', { desc = "check checklist", noremap = true, silent = true })
-- keymap.set('n', '<Leader>mu', 'V<CMD>s/\\[x\\]/\\[\\ \\]/ge<CR><ESC>', { desc = "uncheck checklist", noremap = true, silent = true })
keymap.set('n', '<Leader>tm', function()
  local row = vim.api.nvim_win_get_cursor(0)[1] -- 現在の行番号（1-based）
  local line = vim.api.nvim_get_current_line()

  local new_line
  if line:match("%[ %]") then
    new_line = line:gsub("%[ %]", "[x]")
  elseif line:match("%[x%]") then
    new_line = line:gsub("%[x%]", "[ ]")
  end

  if new_line then
    vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
  end
end, { desc = "Toggle checklist checkbox", noremap = true, silent = true })

-----------------------------------------------------------
-- hlchunk用処理
-----------------------------------------------------------
keymap.set("n", "<Leader>th", require("hamu.plugins.hlchunk").toggle, { desc = "Toggle HLChunk" })

-- for Markdown
function _G.empty_line_insert()
  return vim.fn.empty(vim.fn.getline('.')) == 1 and '"_cc' or 'i'
end

function _G.empty_line_append()
  return vim.fn.empty(vim.fn.getline('.')) == 1 and '"_cc' or 'A'
end
-- nnoremap <expr> i empty(getline('.')) ? '"_cc' : 'i'
-- nnoremap <expr> A empty(getline('.')) ? '"_cc' : 'A'

-- "Show Diagnostic"を表示
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic message", noremap = true, silent = true })

-- JSON formatter : brew install jq
vim.api.nvim_create_autocmd("FileType", {
pattern = "json",
callback = function()
  vim.keymap.set("n", '<Leader>j', [[:%!jq '.'<CR>]], {desc = "format JSON", noremap = true})
end,
})
vim.keymap.set('x', '<Leader>j', [[:'<,'>!jq .<CR>]], {desc = "format selected JSON", noremap = true})

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
