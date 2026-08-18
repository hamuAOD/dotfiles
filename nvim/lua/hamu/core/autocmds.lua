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
-- 必要になった場合に再検討する。
--[[
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
--]]
