return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')

    if vim.fn.has("win32") == 1 then
      vim.env.CC = "gcc"
    end

    -- パーサーをまとめてインストール
    ts.install({
      "bash", "c", "css", "diff", "dockerfile",
      "git_config", "gitignore", "go", "html", "ini",
      "javascript", "json", "lua", "markdown", "python",
      "rust", "swift", "toml", "typescript", "vim", "yaml"
    })

    -- ファイルを開いたときにハイライトとインデントを有効化
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('MyTreesitter', { clear = true }),
      pattern = '*',
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
