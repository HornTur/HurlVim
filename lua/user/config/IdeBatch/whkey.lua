local wk = require("which-key")

-- Modern, theme-aware setup with fancy UI
wk.setup({
    preset = "modern",
    delay = 300,
    triggers_blacklist = {
        n = { '"' },
    },
    -- Fancy window configuration
    win = {
        border = "rounded",
        padding = { 0, 0 },
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
    -- triggers = {
    --   { "<auto>", mode = "nixsotc" },
    --   { "<leader>", mode = { "n", "v" } },
    -- },
})

-- ============================================
-- Which-Key Configuration
-- Clean, organized keymaps for better workflow
-- ============================================


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
-- WARNING: : You are not allowed to add amy other groups outside these like A group will and must not exist standalone!
-- WARNING  : You can only add groups inside these Big Groups only as a Child Groups like leader aA
-- WARNING  : If a Group is useless only delete the items inside it !
-- NOTE:    : Must verify your keymappings before publishing them out & you are not allowed to ruin them !
-- NOTE:    : MUST add FIXED todo like this but here in capital only -->  -- Fixed:
-- NOTE:    : Do only stay inside the wk.add({ ....... }) table !
-- NOTE:    : TAKE A LOOK AT ~/.config/nvrush/lua/user/config/IdeBatch/telescope.lua for better understanding of how to add mappings to which key ui even in differemt files !

wk.add({
    -- ===============
    -- a/A Group
    -- ===============
    { "<leader>a",    group = "Reserved : For Harpoon Add" },
    { "<leader>aA",   group = "A Subgroup" },


    -- FIXED:

    -- ===============
    -- B/b Group
    -- ===============
    { "<leader>b",    group = "b/B Group" },
    { "<leader>b",    group = "B Subgroup" },
    { "<leader>bd",   "<Cmd>bdelete<CR>",                        desc = "Delete Current" },
    { "<leader>bn",   "<Cmd>bnext<CR>",                          desc = "Next" },
    { "<leader>bp",   "<Cmd>bprevious<CR>",                      desc = "Previous" },
    { "<leader>bl",   "<Cmd>blast<CR>",                          desc = "Last" },
    { "<leader>bs",   "<Cmd>w<CR>",                              desc = "Save" },
    { "<leader>bw",   "<Cmd>bwipeout<CR>",                       desc = "Wipeout" },
    { "<leader>bi",   "<Cmd>IBLToggle<CR>",                      desc = "Toggle IBL" },


    -- ===============
    -- C/c Group
    -- ===============
    { "<leader>c",    group = "c/C Group" },
    { "<leader>c",    group = "C Subgroup" },
    { "<leader>cr",   "<Cmd>source $MYVIMRC<CR>",                desc = "Reload Config" },
    { "<leader>cR",   "<Cmd>LspRestart<CR>",                     desc = "Restart LSP" },
    { "<leader>cp",   "<Cmd>Lazy<CR>",                           desc = "Plugin Manager" },
    { "<leader>cP",   "<Cmd>Lazy profile<CR>",                   desc = "Profile Plugins" },
    { "<leader>cu",   "<Cmd>Lazy update<CR>",                    desc = "Update Plugins" },
    { "<leader>cU",   "<Cmd>Lazy update --wait<CR>",             desc = "Update Plugins (Wait)" },
    { "<leader>cw",   "<Cmd>pwd<CR>",                            desc = "Working Directory" },

    -- ===============
    -- D/d Group
    -- ===============
    { "<leader>d",    group = "d/D Group" },
    { "<leader>d",    group = "D Subgroup" },
    { "<leader>dt",   "<Cmd>Trouble diagnostics toggle<CR>",     desc = "Toggle Trouble" },
    { "<leader>dr",   "<Cmd>Trouble diagnostics<CR>",            desc = "Diagnostics Report" },
    { "<leader>dn",   "<Cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    { "<leader>dp",   "<Cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous Diagnostic" },

    -- E - File Explorer
    { "<leader>e",    group = "e/E Group" },
    { "<leader>eE",   group = "E Subroup" },
    { "<leader>eT",   group = "NvimTree Subroup" },
    { "<leader>eTn",  "<Cmd>NvimTreeToggle<CR>",                 desc = "Explorer" },
    { "<leader>e",    "<Cmd>NvimTreeRefresh<CR>",                desc = "Refresh Explorer" },

    -- ===============
    -- T Group
    -- ===============
    { "<leader>t",    group = "t/T Group" },
    { "<leader>tt",   "<Cmd>Trouble diagnostics toggle<CR>",     desc = "Toggle Diagnostics" },
    { "<leader>td",   "<Cmd>Trouble diagnostics<CR>",            desc = "Diagnostics" },
    { "<leader>tq",   "<Cmd>Trouble quickfix toggle<CR>",        desc = "Quickfix" },
    { "<leader>tl",   "<Cmd>Trouble loclist toggle<CR>",         desc = "Location List" },
    { "<leader>ts",   "<Cmd>Trouble symbols toggle<CR>",         desc = "Symbols" },

    { "<leader>tf",   group = "Telescope Cmds" },
    { "<leader>tft",  "<Cmd>Telescope colorscheme<CR>",          desc = "Themes" },
    { "<leader>tfn",  "<Cmd>enew<CR>",                           desc = "New File" },
    { "<leader>tfr",  "<Cmd>Telescope oldfiles<CR>",             desc = "Recent Files" },

    { "<leader>tfh",  group = "H Series" },
    { "<leader>tfhs", "<Cmd>Telescope search_history<CR>",       desc = "Search" },
    { "<leader>tfhc", "<Cmd>Telescope command_history<CR>",      desc = "Command" },

    -- ===============
    -- G Group
    -- ===============
    -- G - Git (reserved for git operations)
    { "<leader>g",    group = "Git" },
    -- ===============
    -- G Group
    -- ===============

    -- H - Help
    { "<leader>h",    group = "Help" },
    { "<leader>hh",   "<Cmd>Telescope help_tags<CR>",            desc = "Help Tags" },
    { "<leader>hm",   "<Cmd>Telescope man_pages<CR>",            desc = "Man Pages" },
    { "<leader>hk",   "<Cmd>Telescope keymaps<CR>",              desc = "Keymaps" },
    { "<leader>hc",   "<Cmd>Telescope commands<CR>",             desc = "Commands" },
    -- ===============
    -- G Group
    -- ===============

    -- I - Insert (reserved)
    { "<leader>i",    group = "Insert" },
    -- ===============
    -- G Group
    -- ===============

    -- J - Jump (reserved)
    { "<leader>j",    group = "Jump" },
    -- ===============
    -- G Group
    -- ===============

    -- K - (reserved)
    { "<leader>k",    group = "Misc" },
    -- ===============
    -- G Group
    -- ===============

    -- L - LSP
    -- ===============
    -- G Group
    -- ===============
    { "<leader>l",    group = "LSP" },
    { "<leader>lr",   "<Cmd>LspRestart<CR>",                     desc = "Restart" },
    { "<leader>li",   "<Cmd>LspInfo<CR>",                        desc = "Info" },
    { "<leader>ll",   "<Cmd>LspLog<CR>",                         desc = "Log" },

    -- M - Messages/Notifications
    -- ===============
    -- G Group
    -- ===============
    { "<leader>m",    group = "Messages" },
    { "<leader>mm",   "<Cmd>messages<CR>",                       desc = "Show Messages" },
    { "<leader>mn",   "<Cmd>Telescope notify<CR>",               desc = "Notifications" },
    { "<leader>me",   "<Cmd>Noice errors<CR>",                   desc = "Errors (Noice)" },
    { "<leader>mc",   "<Cmd>messages clear<CR>",                 desc = "Clear Messages" },
    { "<leader>my",   "<Cmd>%y+<CR>",                            desc = "Yank All" },
    -- Paste
    { "<leader>mp",   group = "Paste" },
    { "<leader>mpa",  '"+p',                                     desc = "After Cursor" },
    { "<leader>mpb",  '"+P',                                     desc = "Before Cursor" },

    -- N - (reserved)
    -- ===============
    -- G Group
    -- ===============
    { "<leader>n",    group = "New" },
    { "<leader>nf",   "<Cmd>enew<CR>",                           desc = "New File" },

    -- O - (reserved)
    -- ===============
    -- G Group
    -- ===============
    { "<leader>o",    group = "Open" },

    -- P - (reserved)
    -- ===============
    -- G Group
    -- ===============
    { "<leader>p",    group = "Project" },

    -- Q - Quit
    -- ===============
    -- G Group
    -- ===============
    { "<leader>q",    group = "Quit" },
    { "<leader>qq",   "<Cmd>q<CR>",                              desc = "Quit" },
    { "<leader>qf",   "<Cmd>q!<CR>",                             desc = "Force Quit" },
    { "<leader>qa",   "<Cmd>qa<CR>",                             desc = "Quit All" },
    { "<leader>qF",   "<Cmd>qa!<CR>",                            desc = "Force Quit All" },
    { "<leader>qw",   "<Cmd>wq<CR>",                             desc = "Save & Quit" },
    { "<leader>qW",   "<Cmd>wqa<CR>",                            desc = "Save All & Quit" },

    -- R - Replace/Substitute
    -- ===============
    -- G Group
    -- ===============
    { "<leader>r",    group = "Replace" },
    { "<leader>ra",   ":lua SubstituteAll()<CR>",                desc = "Whole File" },
    { "<leader>rm",   ":lua SubstituteMatchingLines()<CR>",      desc = "Matching Lines" },
    { "<leader>rr",   ":lua SubstituteRange()<CR>",              desc = "Range" },
    { "<leader>re",   "<Cmd>NvimTreeRefresh<CR>",                desc = "Refresh Explorer" },

    -- S - Save (Quick Access)
    -- ===============
    -- G Group
    -- ===============
    { "<leader>S",    group = "Session" },

    { "<leader>Sv",   "<Cmd>SessionSave<CR>",                    desc = "Save Session" },
    { "<leader>Sr",   "<Cmd>SessionRestore<CR>",                 desc = "Restore Session" },
    { "<leader>Ss",   "<Cmd>SessionSearch<CR>",                  desc = "Search Session" },


    -- ===============
    -- G Group
    -- ===============
    { "<leader>u",    group = "u/U Group" },
    { "<leader>un",   "<Cmd>set number!<CR>",                    desc = "Line Numbers" },
    { "<leader>ur",   "<Cmd>set relativenumber!<CR>",            desc = "Relative Numbers" },
    { "<leader>uw",   "<Cmd>set wrap!<CR>",                      desc = "Word Wrap" },
    { "<leader>us",   "<Cmd>set spell!<CR>",                     desc = "Spell Check" },
    { "<leader>ul",   "<Cmd>set list!<CR>",                      desc = "List Chars" },
    { "<leader>uc",   "<Cmd>set cursorline!<CR>",                desc = "Cursor Line" },
    { "<leader>uh",   "<Cmd>set hlsearch!<CR>",                  desc = "Highlight Search" },

    -- ===============
    -- G Group
    -- ===============
    { "<leader>v",    group = "v/V Group" },

    -- ===============
    -- w/W Group
    -- ===============
    { "<leader>w",    group = "w/W Group" },
    { "<leader>wh",   "<C-w>h",                                  desc = "Go Left" },
    { "<leader>wj",   "<C-w>j",                                  desc = "Go Down" },
    { "<leader>wk",   "<C-w>k",                                  desc = "Go Up" },
    { "<leader>wl",   "<C-w>l",                                  desc = "Go Right" },
    { "<leader>ws",   "<C-w>s",                                  desc = "Split Below" },
    { "<leader>wv",   "<C-w>v",                                  desc = "Split Right" },
    { "<leader>wq",   "<C-w>q",                                  desc = "Close" },
    { "<leader>wo",   "<C-w>o",                                  desc = "Close Others" },
    { "<leader>w=",   "<C-w>=",                                  desc = "Equal Size" },

    -- ===============
    -- G Group
    -- ===============
    { "<leader>x",    group = "x/X Group" },

    -- ===============
    -- Y/y Group
    -- ===============
    { "<leader>y",    group = "y/Y Group" },
    { "<leader>ya",   "<Cmd>%y+<CR>",                            desc = "Yank All" },
    { "<leader>yp",   "<Cmd>let @+ = expand('%:p')<CR>",         desc = "Yank File Path" },
    { "<leader>yf",   "<Cmd>let @+ = expand('%:t')<CR>",         desc = "Yank File Name" },

    -- ===============
    -- Z/z Group
    -- ===============
    { "<leader>z",    group = "z/Z Group" },
})

-- ============================================
-- Visual/Select Mode Mappings
-- ============================================
wk.add({
    mode = { "v", "x" },
    { "<leader>r",  group = "Replace" },
    { "<leader>rs", ":s///g<Left><Left>", desc = "In Selection" },
    { "<leader>y",  '"+y',                desc = "Yank to Clipboard" },
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
