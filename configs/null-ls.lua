local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.eslint_d,
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black,
  b.formatting.isort,
  b.diagnostics.ruff,
  b.formatting.ruff,

  -- docker
  b.diagnostics.hadolint,

  -- other
  b.diagnostics.actionlint,
  b.diagnostics.ansiblelint,
  b.formatting.markdownlint,
  b.diagnostics.markdownlint,
  b.code_actions.shellcheck,
  b.diagnostics.shellcheck,
  b.formatting.shfmt,
  b.formatting.taplo,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
  debug = true,
  sources = sources,
}
