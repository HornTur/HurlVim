local wk = require("which-key")

-- Modern, theme-aware setup with fancy UI
wk.setup({
  preset = "modern",
  delay = 300,
  
  -- Fancy window configuration
  win = {
    border = "rounded",
    padding = { 1, 2 },
    title = true,
    title_pos = "center",
    zindex = 1000,
    
    -- Modern styling
    wo = {
      winblend = 10, -- Slight transparency for modern look
    },
  },
  
  -- Layout configuration
  layout = {
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  
  -- Enhanced icons
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
    ellipsis = "…",
    
    -- Fancy mappings with better icons
    mappings = true,
    rules = {},
    colors = true,
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },
  
  -- Show help and command preview
  show_help = true,
  show_keys = true,
  
  -- Disable for certain filetypes
  disable = {
    ft = {},
    bt = {},
  },
  
  -- Enhanced documentation
  triggers = {
    { "<auto>", mode = "nixsotc" },
    { "<leader>", mode = { "n", "v" } },
  },
})

-- ============================================
-- Which-Key Configuration
-- Clean, organized keymaps for better workflow
-- ============================================

local wk = require("which-key")

-- ============================================
-- Leader Key Groups
-- ============================================
-- ============================================
-- Which-Key Configuration
-- Clean, organized keymaps for better workflow
-- ============================================

local wk = require("which-key")

-- ============================================
-- Leader Key Groups with Named Categories
-- ============================================
wk.add({
  -- A - Not assigned (reserved for custom)
  { "<leader>a", group = "Actions" },

  -- B - Buffer Management
  { "<leader>b", group = "Buffer" },
  { "<leader>ba", "<Cmd>%bd|e#<CR>", desc = "Delete All Others" },
  { "<leader>bd", "<Cmd>bdelete<CR>", desc = "Delete Current" },
  { "<leader>bn", "<Cmd>bnext<CR>", desc = "Next" },
  { "<leader>bp", "<Cmd>bprevious<CR>", desc = "Previous" },
  { "<leader>bl", "<Cmd>blast<CR>", desc = "Last" },
  { "<leader>bs", "<Cmd>w<CR>", desc = "Save" },
  { "<leader>bw", "<Cmd>bwipeout<CR>", desc = "Wipeout" },
  { "<leader>bi", "<Cmd>IBLToggle<CR>", desc = "Toggle IBL" },


  -- C - Config/Settings
  { "<leader>c", group = "Config" },
  { "<leader>cf", "<Cmd>Telescope find_files cwd=~/.config/nvim<CR>", desc = "Find Files" },
  { "<leader>cg", "<Cmd>Telescope live_grep cwd=~/.config/nvim<CR>", desc = "Grep Files" },
  { "<leader>cr", "<Cmd>source $MYVIMRC<CR>", desc = "Reload Config" },
  { "<leader>cR", "<Cmd>LspRestart<CR>", desc = "Restart LSP" },
  { "<leader>cp", "<Cmd>Lazy<CR>", desc = "Plugin Manager" },
  { "<leader>cP", "<Cmd>Lazy profile<CR>", desc = "Profile Plugins" },
  { "<leader>cu", "<Cmd>Lazy update<CR>", desc = "Update Plugins" },
  { "<leader>cU", "<Cmd>Lazy update --wait<CR>", desc = "Update Plugins (Wait)" },
  { "<leader>cw", "<Cmd>pwd<CR>", desc = "Working Directory" },
  { "<leader>ck", "<Cmd>Telescope keymaps<CR>", desc = "Search Keymaps" },
  { "<leader>cn", "<Cmd>Telescope notify<CR>", desc = "Notifications" },

  -- D - Diagnostics
  { "<leader>d", group = "Diagnostics" },
  { "<leader>db", "<Cmd>Telescope diagnostics bufnr=0<CR>", desc = "Buffer Diagnostics" },
  { "<leader>dw", "<Cmd>Telescope diagnostics<CR>", desc = "Workspace Diagnostics" },
  { "<leader>dt", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Toggle Trouble" },
  { "<leader>dr", "<Cmd>Trouble diagnostics<CR>", desc = "Diagnostics Report" },
  { "<leader>dl", "<Cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostics" },
  { "<leader>dn", "<Cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
  { "<leader>dp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous Diagnostic" },

  -- E - File Explorer
  { "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "Explorer" },
  { "<leader>E", "<Cmd>NvimTreeRefresh<CR>", desc = "Refresh Explorer" },

  -- F - Find/Search (Telescope)
  { "<leader>f", group = "Find" },
  { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Files" },
  { "<leader>fF", "<Cmd>Telescope find_files hidden=true no_ignore=true<CR>", desc = "Files (All)" },
  { "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Grep" },
  { "<leader>fG", "<Cmd>Telescope live_grep additional_args={'--hidden'}<CR>", desc = "Grep (Hidden)" },
  { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
  { "<leader>fB", "<Cmd>Telescope buffers show_all_buffers=true<CR>", desc = "Buffers (All)" },
  { "<leader>fw", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in Buffer" },
  { "<leader>fc", "<Cmd>Telescope commands<CR>", desc = "Commands" },
  { "<leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Keymaps" },
  { "<leader>ft", "<Cmd>Telescope colorscheme<CR>", desc = "Themes" },
  { "<leader>fn", "<Cmd>enew<CR>", desc = "New File" },
  { "<leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
  
  -- Find History
  { "<leader>fh", group = "History" },
  { "<leader>fhs", "<Cmd>Telescope search_history<CR>", desc = "Search" },
  { "<leader>fhc", "<Cmd>Telescope command_history<CR>", desc = "Command" },
  
  -- Find Config
  { "<leader>f.", "<Cmd>Telescope find_files cwd=~/.config/nvim<CR>", desc = "Config Files" },
  { "<leader>fa", "<Cmd>Telescope autocommands<CR>", desc = "Autocommands" },

  -- G - Git (reserved for git operations)
  { "<leader>g", group = "Git" },

  -- H - Help
  { "<leader>h", group = "Help" },
  { "<leader>hh", "<Cmd>Telescope help_tags<CR>", desc = "Help Tags" },
  { "<leader>hm", "<Cmd>Telescope man_pages<CR>", desc = "Man Pages" },
  { "<leader>hk", "<Cmd>Telescope keymaps<CR>", desc = "Keymaps" },
  { "<leader>hc", "<Cmd>Telescope commands<CR>", desc = "Commands" },

  -- I - Insert (reserved)
  { "<leader>i", group = "Insert" },

  -- J - Jump (reserved)
  { "<leader>j", group = "Jump" },

  -- K - (reserved)
  { "<leader>k", group = "Misc" },

  -- L - LSP
  { "<leader>l", group = "LSP" },
  { "<leader>lr", "<Cmd>LspRestart<CR>", desc = "Restart" },
  { "<leader>li", "<Cmd>LspInfo<CR>", desc = "Info" },
  { "<leader>ll", "<Cmd>LspLog<CR>", desc = "Log" },

  -- M - Messages/Notifications
  { "<leader>m", group = "Messages" },
  { "<leader>mm", "<Cmd>messages<CR>", desc = "Show Messages" },
  { "<leader>mn", "<Cmd>Telescope notify<CR>", desc = "Notifications" },
  { "<leader>me", "<Cmd>Noice errors<CR>", desc = "Errors (Noice)" },
  { "<leader>mc", "<Cmd>messages clear<CR>", desc = "Clear Messages" },
  { "<leader>my", "<Cmd>%y+<CR>", desc = "Yank All" },
  
  -- Paste
  { "<leader>mp", group = "Paste" },
  { "<leader>mpa", '"+p', desc = "After Cursor" },
  { "<leader>mpb", '"+P', desc = "Before Cursor" },

  -- N - (reserved)
  { "<leader>n", group = "New" },
  { "<leader>nf", "<Cmd>enew<CR>", desc = "New File" },

  -- O - (reserved)
  { "<leader>o", group = "Open" },

  -- P - (reserved)
  { "<leader>p", group = "Project" },

  -- Q - Quit
  { "<leader>q", group = "Quit" },
  { "<leader>qq", "<Cmd>q<CR>", desc = "Quit" },
  { "<leader>qf", "<Cmd>q!<CR>", desc = "Force Quit" },
  { "<leader>qa", "<Cmd>qa<CR>", desc = "Quit All" },
  { "<leader>qF", "<Cmd>qa!<CR>", desc = "Force Quit All" },
  { "<leader>qw", "<Cmd>wq<CR>", desc = "Save & Quit" },
  { "<leader>qW", "<Cmd>wqa<CR>", desc = "Save All & Quit" },

  -- R - Replace/Substitute
  { "<leader>r", group = "Replace" },
  { "<leader>ra", ":lua SubstituteAll()<CR>", desc = "Whole File" },
  { "<leader>rm", ":lua SubstituteMatchingLines()<CR>", desc = "Matching Lines" },
  { "<leader>rr", ":lua SubstituteRange()<CR>", desc = "Range" },
  { "<leader>re", "<Cmd>NvimTreeRefresh<CR>", desc = "Refresh Explorer" },

  -- S - Save (Quick Access)
  { "<leader>S", group = "Session" },
  
  { "<leader>Sv", "<Cmd>SessionSave<CR>", desc = "Save Session" },
  { "<leader>Sr", "<Cmd>SessionRestore<CR>", desc = "Restore Session" },
  { "<leader>Ss", "<Cmd>SessionSearch<CR>", desc = "Search Session" },

  -- T - Trouble/Toggle
  { "<leader>t", group = "Trouble" },
  { "<leader>tt", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Toggle Diagnostics" },
  { "<leader>td", "<Cmd>Trouble diagnostics<CR>", desc = "Diagnostics" },
  { "<leader>tq", "<Cmd>Trouble quickfix toggle<CR>", desc = "Quickfix" },
  { "<leader>tl", "<Cmd>Trouble loclist toggle<CR>", desc = "Location List" },
  { "<leader>ts", "<Cmd>Trouble symbols toggle<CR>", desc = "Symbols" },

  -- U - UI/Toggle
  { "<leader>u", group = "UI" },
  { "<leader>un", "<Cmd>set number!<CR>", desc = "Line Numbers" },
  { "<leader>ur", "<Cmd>set relativenumber!<CR>", desc = "Relative Numbers" },
  { "<leader>uw", "<Cmd>set wrap!<CR>", desc = "Word Wrap" },
  { "<leader>us", "<Cmd>set spell!<CR>", desc = "Spell Check" },
  { "<leader>ul", "<Cmd>set list!<CR>", desc = "List Chars" },
  { "<leader>uc", "<Cmd>set cursorline!<CR>", desc = "Cursor Line" },
  { "<leader>uh", "<Cmd>set hlsearch!<CR>", desc = "Highlight Search" },

  -- V - (reserved)
  { "<leader>v", group = "View" },

  -- W - Window Management
  { "<leader>w", group = "Window" },
  { "<leader>wh", "<C-w>h", desc = "Go Left" },
  { "<leader>wj", "<C-w>j", desc = "Go Down" },
  { "<leader>wk", "<C-w>k", desc = "Go Up" },
  { "<leader>wl", "<C-w>l", desc = "Go Right" },
  { "<leader>ws", "<C-w>s", desc = "Split Below" },
  { "<leader>wv", "<C-w>v", desc = "Split Right" },
  { "<leader>wq", "<C-w>q", desc = "Close" },
  { "<leader>wo", "<C-w>o", desc = "Close Others" },
  { "<leader>w=", "<C-w>=", desc = "Equal Size" },

  -- X - (reserved)
  { "<leader>x", group = "Execute" },

  -- Y - Yank
  { "<leader>y", group = "Yank" },
  { "<leader>ya", "<Cmd>%y+<CR>", desc = "Yank All" },
  { "<leader>yp", "<Cmd>let @+ = expand('%:p')<CR>", desc = "Yank File Path" },
  { "<leader>yf", "<Cmd>let @+ = expand('%:t')<CR>", desc = "Yank File Name" },

  -- Z - (reserved)
  { "<leader>z", group = "Fold" },
})

-- ============================================
-- Visual/Select Mode Mappings
-- ============================================
wk.add({
  mode = { "v", "x" },
  { "<leader>r", group = "Replace" },
  { "<leader>rs", ":s///g<Left><Left>", desc = "In Selection" },
  { "<leader>y", '"+y', desc = "Yank to Clipboard" },
})

-- ============================================
-- Helper Functions (if not already defined)
-- ============================================

-- Replace in entire file
function SubstituteAll()
  local search = vim.fn.input("Search: ")
  if search == "" then return end
  local replace = vim.fn.input("Replace with: ")
  vim.cmd(string.format("%%s/%s/%s/g", search, replace))
end

-- Replace in matching lines
function SubstituteMatchingLines()
  local pattern = vim.fn.input("Match pattern: ")
  if pattern == "" then return end
  local search = vim.fn.input("Search: ")
  if search == "" then return end
  local replace = vim.fn.input("Replace with: ")
  vim.cmd(string.format("g/%s/s/%s/%s/g", pattern, search, replace))
end

-- Replace in range
function SubstituteRange()
  local start_line = vim.fn.input("Start line: ")
  if start_line == "" then return end
  local end_line = vim.fn.input("End line: ")
  if end_line == "" then return end
  local search = vim.fn.input("Search: ")
  if search == "" then return end
  local replace = vim.fn.input("Replace with: ")
  vim.cmd(string.format("%s,%ss/%s/%s/g", start_line, end_line, search, replace))
end

-- ============================================
-- Troubleshooting Note
-- ============================================
-- If Trouble diagnostics doesn't open, ensure:
-- 1. Trouble.nvim is installed: require("trouble").setup()
-- 2. Run :checkhealth trouble
-- 3. Try: :Trouble diagnostics toggle
-- 4. Alternative: Use <leader>dr for direct command
