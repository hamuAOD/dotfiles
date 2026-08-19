--- ファイルを最後に閉じた位置へカーソルを戻す
local cursor_group = vim.api.nvim_create_augroup("RememberCursor", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = cursor_group,
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 1 and last_pos <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

--- 保存時に不要な文字を削除する
local save_cleanup_group = vim.api.nvim_create_augroup("SaveCleanup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = save_cleanup_group,
  pattern = "*",
  callback = function()
    if vim.bo.buftype ~= "" or not vim.bo.modifiable then
      return
    end

    local view = vim.fn.winsaveview()
    -- 行末の空白を削除
    vim.cmd([[%s/\s\+$//ge]])
    -- FC2由来の不要な文字列を削除
    vim.cmd([[%s/\*\*\*ysqxzzosy//ge]])
    vim.fn.winrestview(view)
  end,
})

--- 特定文字を強調する
local bad_char_group = vim.api.nvim_create_augroup("BadChar", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = bad_char_group,
  pattern = "*",
  command = [[match Error /‐\|–\|“\|’\|\s\+$/]],
  command = [[match Error /‐\|–\|“\|’\| \+$/]],
})

-- 開いたファイルの場所をタブのカレントディレクトリにする
-- Oilは現在のファイルの親ディレクトリを直接開けるため、現在は無効化。
-- -> lazygitとかで面倒だからやっぱ有効化
-- 必要になった場合に再検討する。
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "" then
      local file = vim.api.nvim_buf_get_name(0)
      if file ~= "" then
        local dir = vim.fn.fnamemodify(file, ":p:h")
        if vim.fn.isdirectory(dir) == 1 then
          vim.cmd.tcd(vim.fn.fnameescape(dir))
        end
      end
    end
  end,
})

--- CSV, TSVファイルのチェックボックス表示
local csv_boolean_group =
  vim.api.nvim_create_augroup("CsvBooleanConceal", { clear = true })
local csv_boolean_overlay_ns =
  vim.api.nvim_create_namespace("CsvBooleanOverlay")
local csv_boolean_refresh_pending = {}

---Return the byte ranges of fields in a single CSV/TSV record.
---Quoted delimiters and doubled quotes are handled as well.
---@param line string
---@param delimiter string
---@return table[]
local function csv_field_ranges(line, delimiter)
  local fields = {}
  local field_start = 0
  local quoted = false
  local i = 1

  while i <= #line do
    local char = line:sub(i, i)
    if char == '"' then
      if quoted and line:sub(i + 1, i + 1) == '"' then
        i = i + 2
      else
        quoted = not quoted
        i = i + 1
      end
    elseif char == delimiter and not quoted then
      fields[#fields + 1] = { start_col = field_start, end_col = i - 1 }
      field_start = i
      i = i + 1
    else
      i = i + 1
    end
  end

  fields[#fields + 1] = { start_col = field_start, end_col = #line }
  return fields
end

---Overlay booleans with equal-width checkbox text so csvview borders stay aligned.
---@param bufnr integer
local function refresh_csv_boolean_overlay(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  local filetype = vim.bo[bufnr].filetype
  if filetype ~= "csv" and filetype ~= "tsv" then
    return
  end

  local csvview_info = vim.b[bufnr].csvview_info
  local delimiter = csvview_info
      and csvview_info.delimiter
      and csvview_info.delimiter.text
    or (filetype == "tsv" and "\t" or ",")
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  vim.api.nvim_buf_clear_namespace(bufnr, csv_boolean_overlay_ns, 0, -1)

  for row, line in ipairs(lines) do
    local fields = csv_field_ranges(line, delimiter)
    for column = 4, 5 do
      local field = fields[column]
      if field then
        local raw = line:sub(field.start_col + 1, field.end_col)
        local value = vim.trim(raw)
        value = value:match('^"(.*)"$') or value
        value = vim.trim(value)
        local symbol

        if value == "TRUE" then
          symbol = ""
        elseif value == "FALSE" then
          symbol = ""
        end

        if symbol then
          local token_start = raw:find(value, 1, true)
          local padding = vim.fn.strdisplaywidth(value) - vim.fn.strdisplaywidth(symbol)
          local display = symbol .. string.rep(" ", math.max(padding, 0))

          vim.api.nvim_buf_set_extmark(
            bufnr,
            csv_boolean_overlay_ns,
            row - 1,
            field.start_col + token_start - 1,
            {
              virt_text = { { display, "CsvBooleanCheckbox" } },
              virt_text_pos = "overlay",
              hl_mode = "replace",
              priority = 5000,
              right_gravity = false,
            }
          )
        end
      end
    end
  end
end

---@param bufnr integer
local function schedule_csv_boolean_refresh(bufnr)
  if csv_boolean_refresh_pending[bufnr] then
    return
  end

  csv_boolean_refresh_pending[bufnr] = true
  vim.schedule(function()
    csv_boolean_refresh_pending[bufnr] = nil
    refresh_csv_boolean_overlay(bufnr)
  end)
end

vim.api.nvim_create_autocmd("FileType", {
  group = csv_boolean_group,
  pattern = { "csv", "tsv" },
  callback = function(args)
    -- カーソル行でもチェックボックス表示を維持する
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nvic"
    vim.api.nvim_set_hl(0, "CsvBooleanCheckbox", { link = "Comment", default = true })

    -- 標準CSV syntaxとcsvview.nvimのロード完了後に追加する
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then
        return
      end

      vim.api.nvim_buf_call(args.buf, function()
        vim.cmd([[
          silent! syntax clear CsvChecked
          silent! syntax clear CsvUnchecked
        ]])

        schedule_csv_boolean_refresh(args.buf)
      end)
    end)
  end,
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter" }, {
  group = csv_boolean_group,
  callback = function(args)
    if vim.bo[args.buf].filetype == "csv" or vim.bo[args.buf].filetype == "tsv" then
      schedule_csv_boolean_refresh(args.buf)
    end
  end,
})

vim.api.nvim_create_autocmd("BufWipeout", {
  group = csv_boolean_group,
  callback = function(args)
    csv_boolean_refresh_pending[args.buf] = nil
  end,
})
