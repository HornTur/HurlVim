-- =====================
-- Modern Nvim-tree setup
-- =====================
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local opts = function(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default keymaps + custom ones
  api.config.mappings.default_on_attach(bufnr)

  -- Extra keymaps
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,

  view = {
    width = 35,
    side = "left",
  },

  renderer = {
    highlight_git = true,
    highlight_opened_files = "all",
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },

  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules" },
  },

  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },

  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

-- Keymap to toggle nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>re", ":NvimTreeRefresh<CR>", { desc = "Refresh File Explorer" })
vim.keymap.set("n", "<leader>ne", ":NvimTreeFindFile<CR>", { desc = "Find Current File in Explorer" })
