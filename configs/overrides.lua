local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "json",
    "yaml",
    "dockerfile",
    "toml",
    "bash",
    "astro",
    "jsonc",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "prettierd",
    "eslint_d",
    "js-debug-adapter",
    "json-lsp",
    "tailwindcss-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "black",
    "pyright",
    "ruff-lsp",
    "ruff",
    "debugpy",
    "isort",

    -- docker stuff
    "dockerfile-language-server",
    "docker-compose-language-service",
    "hadolint",

    -- bash
    "bash-language-server",
    "shfmt",
    "shellcheck",
    "bash-debug-adapter",

    -- ansible
    "ansible-language-server",
    "ansible-lint",

    -- other
    "actionlint",
    "astro-language-server",
    "marksman",
    "markdownlint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
