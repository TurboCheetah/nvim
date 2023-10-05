local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = true,
        tailwind = true,
      },
    },

    {
      "NvChad/nvcommunity",
      -- { import = "nvcommunity.completion.copilot" },
      { import = "nvcommunity.git.lazygit" },
      { import = "nvcommunity.diagnostics.trouble" },
      { import = "nvcommunity.motion.harpoon" },
    },
    -- {
    --   "zbirenbaum/copilot.lua",
    --   cmd = "Copilot",
    --   event = "InsertEnter",
    --   opts = {
    --     suggestion = {
    --       auto_trigger = true,
    --       keymap = {
    --         accept = "<A-a>",
    --       },
    --     },
    --   },
    -- },
    {
      "saimo/peek.nvim",
      event = { "VeryLazy" },
      build = "deno task --quiet build:fast",
      config = function()
        require("peek").setup {
          app = "browser",
        }
        -- refer to `configuration to change defaults`
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
      end,
    },
    {
      "Exafunction/codeium.vim",
      event = "LspAttach",
      config = function()
        vim.keymap.set("i", "<A-a>", function()
          return vim.fn["codeium#Accept"]()
        end, { expr = true })
        vim.keymap.set("i", "<A-.>", function()
          return vim.fn["codeium#CycleCompletions"](1)
        end, { expr = true })
        vim.keymap.set("i", "<A-,>", function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true })
      end,
    },
    {
      "David-Kunz/gen.nvim",
      event = "VeryLazy",
    },
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
