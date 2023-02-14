-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local dap = require("dap")
dap.adapters.python = {
  type = "executable",
  command = "$HOME/.virtualenvs/debugpy/bin/python",
  args = { "-m", "debugpy.adapter" },
}

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
  name = "lldb",
}

require("dap-python").setup("$HOME/.virtualenvs/debugpy/bin/python")
table.insert(require("dap").configurations.python, {
  type = "python",
  request = "launch",
  name = "Launch file",
  program = "${file}",
})

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

require("dapui").setup()
require("window-picker").setup()
