-- =====================
-- Telescope Setup (Gruvbox Opaque Boxed)
-- =====================

---@type any
local telescope = require("telescope")
local themes = require("telescope.themes")

telescope.setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top",
            preview_width   = 0.55,
            width           = 0.90,
            height          = 0.85,
        },
        sorting_strategy = "ascending",
        winblend         = 0,
        prompt_prefix    = "   ",
        selection_caret  = " ",
        entry_prefix     = "   ",
        multi_icon       = " ",
        borderchars      = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        path_display     = { "truncate" },
        color_devicons   = true,
    },
    extensions = {
        fzf = {
            fuzzy                   = true,
            override_generic_sorter = true,
            override_file_sorter    = true,
            case_mode               = "smart_case",
        },
        file_browser = {
            hijack_netrw      = true,
            grouped           = true,
            hidden            = true,
            respect_gitignore = false,
        },
        ["ui-select"] = {
            theme = themes.get_dropdown({
                winblend = 0,
                previewer = false,
                borderchars = {
                    prompt  = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                    results = { " " },
                    preview = { " " },
                },
            }),
        },
    },
})

-- Gruvbox Colors
local colors = {
    bg      = "#1d2021",
    bg_alt  = "#282828",
    border  = "#504945",
    fg      = "#ebdbb2",
    yellow  = "#d79921",
    aqua    = "#83a598",
    red     = "#fb4934",
}

-- Telescope Highlights
local highlights = {
    TelescopeNormal        = { bg = colors.bg,     fg = colors.fg },
    TelescopeBorder        = { bg = colors.bg,     fg = colors.border },
    TelescopePromptNormal  = { bg = colors.bg_alt, fg = colors.fg },
    TelescopePromptBorder  = { bg = colors.bg_alt, fg = colors.yellow },
    TelescopePromptTitle   = { bg = colors.yellow, fg = colors.bg, bold = true },
    TelescopeResultsNormal = { bg = colors.bg,     fg = colors.fg },
    TelescopeResultsBorder = { bg = colors.bg,     fg = colors.border },
    TelescopeResultsTitle  = { bg = colors.aqua,   fg = colors.bg, bold = true },
    TelescopePreviewNormal = { bg = colors.bg,     fg = colors.fg },
    TelescopePreviewBorder = { bg = colors.bg,     fg = colors.border },
    TelescopePreviewTitle  = { bg = colors.red,    fg = colors.bg, bold = true },

    TelescopeSelection       = { bg = "#3c3836", fg = colors.fg },
    TelescopeSelectionCaret  = { fg = colors.yellow, bg = "#3c3836" },
    TelescopeResultsLineNr   = { fg = colors.yellow, bg = colors.bg, bold = true },
    TelescopePromptPrefix    = { fg = colors.yellow, bg = colors.bg_alt, bold = true },
    TelescopePromptCounter   = { fg = colors.aqua,   bg = colors.bg_alt, bold = true },
}

for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
end

-- Load extensions safely
local extensions = { "fzf", "file_browser", "projects", "zoxide", "ui-select", "undo" }
for _, ext in ipairs(extensions) do
    pcall(telescope.load_extension, ext)
end

local opts = { noremap = true, silent = true }

-- 🔹 Builtin Telescope Pickers
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>", opts)

-- 🔹 File Browser
vim.api.nvim_set_keymap('n', '<leader>fe', ":lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)

-- 🔹 Undo History
vim.api.nvim_set_keymap('n', '<leader>fu', ":lua require('telescope').extensions.undo.undo()<CR>", opts)

-- 🔹 Projects
vim.api.nvim_set_keymap('n', '<leader>fp', ":lua require('telescope').extensions.projects.projects()<CR>", opts)

-- 🔹 Zoxide (Quick directory navigation)
vim.api.nvim_set_keymap('n', '<leader>fz', ":lua require('telescope').extensions.zoxide.list()<CR>", opts)

-- 🔹 Lazy.nvim (Plugin manager)
vim.api.nvim_set_keymap(
    'n', '<leader>fl',
    ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('data') .. '/lazy' })<CR>",
    { noremap = true, silent = true }
)

-- 🔹 Telescope keymaps

-- Lazy.nvim directory (plugins installed by lazy.nvim)
local lazy_dir = vim.fn.stdpath("data") .. "/lazy"

-- 1️⃣ Lazy.nvim - Files
vim.api.nvim_set_keymap(
  'n', '<leader>lf',
  ":lua require('telescope.builtin').find_files({ cwd = '"..lazy_dir.."', prompt_title='Lazy Plugins' })<CR>",
  opts
)

-- 2️⃣ Lazy.nvim - Live Grep
vim.api.nvim_set_keymap(
  'n', '<leader>lg',
  ":lua require('telescope.builtin').live_grep({ cwd = '"..lazy_dir.."', prompt_title='Lazy Grep' })<CR>",
  opts
)

-- 3️⃣ Lazy.nvim - Grep String (current word)
vim.api.nvim_set_keymap(
  'n', '<leader>lw',
  ":lua require('telescope.builtin').grep_string({ cwd = '"..lazy_dir.."', prompt_title='Lazy Word' })<CR>",
  opts
)

-- 4️⃣ Neovim config folder (~/.config/nvim) - Files
vim.api.nvim_set_keymap(
  'n', '<leader>lc',
  ":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim', prompt_title='NVim Config' })<CR>",
  opts
)

-- 🔹 Optional: other general Telescope pickers
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fe', ":lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fu', ":lua require('telescope').extensions.undo.undo()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fp', ":lua require('telescope').extensions.projects.projects()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fz', ":lua require('telescope').extensions.zoxide.list()<CR>", opts)
-- 🔹 UI-Select is automatically used by plugins and LSP; no mapping needed

