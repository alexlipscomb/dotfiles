return {
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  -- { "folke/which-key.nvim", opts = { mappings = {} } },
  {
    "nvim-treesitter/nvim-treesitter",
    auto_install = true,
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.beautysh,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.rubocop,
          nls.builtins.formatting.rustfmt,
          nls.builtins.formatting.shellharden,
          nls.builtins.formatting.sql_formatter,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.taplo,
          nls.builtins.formatting.yamlfmt,
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort,
          nls.builtins.hover.printenv,
          nls.builtins.hover.dictionary,

          nls.builtins.formatting.trim_newlines,
          nls.builtins.formatting.trim_whitespace,
        },
      }
    end,
  },

  -- {
  --   "jayp0521/mason-null-ls.nvim",
  --   event = "BufReadPre",
  --   dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
  --   config = {
  --     function()
  --       require("mason-null-ls").setup({
  --         automatic_setup = true,
  --         automatic_installation = true,
  --       })
  --       require("mason-null-ls").setup_handlers({})
  --     end,
  --   },
  -- },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
      open_mapping = "<c-t>",
      direction = "float",
      shell = "fish",

      execs = {
        { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
        { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
        { nil, "<M-3>", "Float Terminal", "float", nil },
      },
    },
  },
  { "RRethy/vim-illuminate" }, -- highlight same symbol elsewhere
  { "romgrk/nvim-treesitter-context", event = "VeryLazy", opts = { enable = true } }, -- show current function
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "mfussenegger/nvim-dap-python" },
  { "simrat39/rust-tools.nvim" },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    event = "BufReadPre",
    rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
    config = function()
      require("mkdnflow").setup({})
    end,
  },
  {
    "github/copilot.vim",
    event = "BufReadPre",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    -- config = function()
    --   vim.cmd("highlight default link gitblame SpecialComment")
    --   vim.g.gitblame_enabled = 0
    -- end,
  },
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  { "lervag/vimtex" },
  { "s1n7ax/nvim-window-picker" },
  { "tidalcycles/vim-tidal", event = "BufReadPre" },
  { "davidgranstrom/scnvim", event = "BufReadPre" },
  { "sindrets/diffview.nvim", event = "BufReadPre" },
  {
    "iamcco/markdown-preview.nvim",
    event = "BufEnter",
    ft = { "md", "markdown" },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
