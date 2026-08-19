local M = {}

--- 空白行の削除
function M.delete_blank_lines(opts)
  vim.cmd(("%d,%dv/./d"):format(opts.line1, opts.line2))
  vim.cmd("nohlsearch")
end

vim.api.nvim_create_user_command("DeleteBlankLine", M.delete_blank_lines, { range = "%" })

--- PLEX用日付整形: YYYYMMDD → YYYY-MM-DD
function M.format_date_p(opts)
  vim.cmd(("%d,%ds#\\v/(\\d{4})/(\\d{2})/(\\d{2})#\\1-\\2-\\3 -#g"):format(opts.line1, opts.line2))
  vim.cmd("nohlsearch")
end

vim.api.nvim_create_user_command("FormatDateP", M.format_date_p, { range = "%" })

--- Finderからコピーした際の改行コード置換
function M.replace_finders_cr(opts)
  vim.cmd(("%d,%ds/\\r/\\r/g"):format(opts.line1, opts.line2))
  vim.cmd("nohlsearch")
end

vim.api.nvim_create_user_command("ReplaceFinderCR", M.replace_finders_cr, { range = "%" })

--- CD Listの並び替え
function M.sort_cd_list()
  vim.cmd(("2,$sort /^[^\\t]*\\t/"))
  vim.cmd(("2,$sort"))
end

vim.api.nvim_create_user_command("SortCDList", M.sort_cd_list, { })
---2,$sort /^[^\t]*\t/

--- Twitch ID 削除
function M.delete_twitch_id(opts)
  vim.cmd(("%d,%ds/\\ \\[v\\d\\+\\]//g"):format(opts.line1, opts.line2))
  vim.cmd("nohlsearch")
end

vim.api.nvim_create_user_command("DeleteTwitchID", M.delete_twitch_id, { range = "%" })

--- 数字7桁
function M.cutout_7num(opts)
  vim.cmd(("%d,%ds/\\vfc.*(\\d{7}).*(\\.[^.]+)$/\\1\\2/g"):format(opts.line1, opts.line2))
  vim.cmd("nohlsearch")
end

vim.api.nvim_create_user_command("Cutout7num", M.cutout_7num, { range = "%" })

--- paste db
function M.paste_fdb()
  local lines = vim.fn.getreg("+", 1, true)

  if #lines == 0 then
    return
  end

  local first_line = lines[1]
  local text = table.concat(lines, "\n")
  local number = vim.fn.matchstr(text, [[\<\d\{7}\>]])
  local date = vim.fn.matchstr(text, [[\<\d\{4}-\d\{2}-\d\{2}\>]])

  if number == "" then
    vim.notify("text format error!", vim.log.levels.WARN)
    return
  end
  if number == "" then
    number = "no date"
  end

  vim.api.nvim_put({
    table.concat({ number, date, lines[1] }, "\t"),
  }, "l", true, true)
end

vim.api.nvim_create_user_command("PasteFDB", M.paste_fdb, {})

--- CUEファイル用検索
--- 検索: 半角スペース+小文字英字 or ASCII範囲外の文字 or 文字列 TITLE
function M.check_cue()
  vim.cmd([[/\( \l\|[^\x01-\x7E]\|TITLE\)]])
end

--- 単語の先頭を大文字に変換
function M.normalize_caps(opts)
  vim.cmd(("%d,%ds/\\<\\w\\+\\>/\\=toupper(submatch(0)[0]).tolower(submatch(0)[1:])/g"):format(opts.line1, opts.line2))
  vim.cmd("nohlsearch")
end

vim.api.nvim_create_user_command("NormalizeCaps", M.normalize_caps, { range = true })

--- 各行文字数チェック
function M.prefix_char_count()
  vim.cmd([[%s/.*/\=printf("%02d\t%s", strchars(submatch(0)), submatch(0))/]])
end
-- vim.api.nvim_create_user_command( "PrefixCharCount", M.prefix_char_count, {})

--- Markdownチェックボックスを行単位で切り替える
function M.toggle_checklist(opts)
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
  for index, line in ipairs(lines) do
    if line:match("%[ %]") then
      lines[index] = line:gsub("%[ %]", "[x]")
    elseif line:match("%[x%]") then
      lines[index] = line:gsub("%[x%]", "[ ]")
    end
  end

  vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
end

vim.api.nvim_create_user_command("ToggleChecklist", M.toggle_checklist, { range = true })

--- 空行ではインデントを引き継いでInsertモードを開始する
function M.empty_line_insert()
  return vim.fn.empty(vim.fn.getline('.')) == 1 and '"_cc' or 'i'
end

function M.empty_line_append()
  return vim.fn.empty(vim.fn.getline('.')) == 1 and '"_cc' or 'A'
end

--- Insertモードでカーソル直前の単語を大文字にする
function M.uppercase_previous_word()
  local line = vim.fn.getline(".")
  local col = vim.fn.getpos(".")[3]
  local substring = line:sub(1, col - 1)
  local word = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])

  return "<C-w>" .. word:upper()
end

--- 指定した階層のfoldをまとめて開閉する
function M.toggle_fold_level(level)
  local has_closed = false

  -- 指定した階層に閉じているfoldがあるか調べる
  for line = 1, vim.fn.line("$") do
    if vim.fn.foldlevel(line) == level and vim.fn.foldclosed(line) ~= -1 then
      has_closed = true
      break
    end
  end

  if has_closed then
    -- 閉じているfoldがあれば、指定した階層をすべて開く
    for line = 1, vim.fn.line("$") do
      if vim.fn.foldlevel(line) == level and vim.fn.foldclosed(line) ~= -1 then
        vim.cmd(line .. "foldopen")
      end
    end
  else
    -- すべて開いていれば、指定した階層以降を閉じる
    vim.opt_local.foldlevel = level - 1
  end
end

for level = 1, 5 do
  local fold_level = level
  vim.api.nvim_create_user_command("ToggleFoldLevel" .. fold_level, function()
    M.toggle_fold_level(fold_level)
  end, {})
end

return M
