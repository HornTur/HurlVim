-- =================================================================
-- LEADER MAPPINGS (Sorted A-Z)
-- =================================================================
-- Generated: 2025-11-10 14:15:41
-- Leader key:
-- Total mappings: 467
-- =================================================================


-- ======================================================================
-- B
-- ======================================================================

-- 󰁍 Cycle prev buffer
vim.keymap.set("n", "<leader>b[", "<Cmd>BufferLineCyclePrev<CR>",
    { desc = "󰁍 Cycle prev buffer", silent = true, noremap = true })
-- 󰁔 Cycle next buffer
vim.keymap.set("n", "<leader>b]", "<Cmd>BufferLineCycleNext<CR>",
    { desc = "󰁔 Cycle next buffer", silent = true, noremap = true })
-- ❌ Delete All Others
vim.keymap.set("n", "<leader>ba", "<Cmd>%bd|e#<CR>", { desc = "❌ Delete All Others", noremap = true })
-- Delete All But Current
vim.keymap.set("n", "<leader>bAD", "<Cmd>%bd|e#|bd#<CR>",
    { desc = "Delete All But Current", silent = true, noremap = true })
-- ❌ Delete Buffer
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "❌ Delete Buffer", noremap = true })
-- 󰓩 Go to last buffer
vim.keymap.set("n", "<leader>bf", "<Cmd>BufferLineGoToBuffer -1<CR>",
    { desc = "󰓩 Go to last buffer", silent = true, noremap = true })
-- 󰅙 Close current group
vim.keymap.set("n", "<leader>bgg", "<Cmd>BufferLineGroupClose<CR>",
    { desc = "󰅙 Close current group", silent = true, noremap = true })
-- 󰅙 Close pinned group
vim.keymap.set("n", "<leader>bgP", "<Cmd>BufferLineGroupClose pinned<CR>",
    { desc = "󰅙 Close pinned group", silent = true, noremap = true })
-- 󰅙 Close ungrouped
vim.keymap.set("n", "<leader>bgp", "<Cmd>BufferLineGroupClose ungrouped<CR>",
    { desc = "󰅙 Close ungrouped", silent = true, noremap = true })
-- 󰓩 Toggle group
vim.keymap.set("n", "<leader>bgt", "<Cmd>BufferLineGroupToggle<CR>",
    { desc = "󰓩 Toggle group", silent = true, noremap = true })
-- 󰓩 Go to buffer 1
vim.keymap.set("n", "<leader>bj", "<Cmd>BufferLineGoToBuffer 1<CR>",
    { desc = "󰓩 Go to buffer 1", silent = true, noremap = true })
-- Last Buffer
vim.keymap.set("n", "<leader>bl", "<Cmd>blast<CR>", { desc = "Last Buffer", silent = true, noremap = true })
-- Next Buffer
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next Buffer", silent = true, noremap = true })
-- Previous Buffer
vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous Buffer", silent = true, noremap = true })
-- Save Buffer
vim.keymap.set("n", "<leader>bs", "<Cmd>w<CR>", { desc = "Save Buffer", silent = true, noremap = true })
-- 󰉋 Sort by directory
vim.keymap.set("n", "<leader>bSd", "<Cmd>BufferLineSortByDirectory<CR>",
    { desc = "󰉋 Sort by directory", silent = true, noremap = true })
-- 󰡛 Sort by extension
vim.keymap.set("n", "<leader>bSe", "<Cmd>BufferLineSortByExtension<CR>",
    { desc = "󰡛 Sort by extension", silent = true, noremap = true })
-- 󰉓 Sort by relative dir
vim.keymap.set("n", "<leader>bSr", "<Cmd>BufferLineSortByRelativeDirectory<CR>",
    { desc = "󰉓 Sort by relative dir", silent = true, noremap = true })
-- 󰓩 Sort by tabs
vim.keymap.set("n", "<leader>bSt", "<Cmd>BufferLineSortByTabs<CR>",
    { desc = "󰓩 Sort by tabs", silent = true, noremap = true })
-- Wipeout Buffer
vim.keymap.set("n", "<leader>bw", "<Cmd>bwipeout<CR>", { desc = "Wipeout Buffer", silent = true, noremap = true })

-- ======================================================================
-- C
-- ======================================================================

vim.keymap.set("n", "<leader>ca", "", { silent = true, noremap = true })
-- ⚡ Code Action
vim.keymap.set("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "⚡ Code Action", noremap = true })
-- Toggle Backup
vim.keymap.set("n", "<leader>cB", "<Cmd>set backup!<CR>", { desc = "Toggle Backup", silent = true, noremap = true })
-- Rebuild Plugins
vim.keymap.set("n", "<leader>cb", "<Cmd>Lazy build<CR>", { desc = "Rebuild Plugins", silent = true, noremap = true })
-- Clear Cache
vim.keymap.set("n", "<leader>cC", "<Cmd>Lazy clear<CR>", { desc = "Clear Cache", silent = true, noremap = true })
-- Clean Plugins
vim.keymap.set("n", "<leader>cc", "<Cmd>Lazy clean<CR>", { desc = "Clean Plugins", silent = true, noremap = true })
-- Change to Config Directory
vim.keymap.set("n", "<leader>cD", "<Cmd>cd ~/.config/nvim<CR>",
    { desc = "Change to Config Directory", silent = true, noremap = true })
-- Change to File Directory
vim.keymap.set("n", "<leader>cd", "<Cmd>cd %:p:h<CR>",
    { desc = "Change to File Directory", silent = true, noremap = true })
-- Edit init.lua (New Tab)
vim.keymap.set("n", "<leader>cE", "<Cmd>tabnew $MYVIMRC<CR>",
    { desc = "Edit init.lua (New Tab)", silent = true, noremap = true })
-- Edit init.lua
vim.keymap.set("n", "<leader>ce", "<Cmd>edit $MYVIMRC<CR>", { desc = "Edit init.lua", silent = true, noremap = true })
-- Find Config Files
vim.keymap.set("n", "<leader>cf", "<Cmd>Telescope find_files cwd=~/.config/nvim<CR>",
    { desc = "Find Config Files", silent = true, noremap = true })
-- Grep Config Files
vim.keymap.set("n", "<leader>cg", "<Cmd>Telescope live_grep cwd=~/.config/nvim<CR>",
    { desc = "Grep Config Files", silent = true, noremap = true })
-- Check Telescope Health
vim.keymap.set("n", "<leader>cH", "<Cmd>checkhealth telescope<CR>",
    { desc = "Check Telescope Health", silent = true, noremap = true })
-- Check Health
vim.keymap.set("n", "<leader>ch", "<Cmd>checkhealth<CR>", { desc = "Check Health", silent = true, noremap = true })
-- Check LSP Health
vim.keymap.set("n", "<leader>chl", "<Cmd>checkhealth lsp<CR>",
    { desc = "Check LSP Health", silent = true, noremap = true })
-- Check Mason Health
vim.keymap.set("n", "<leader>chm", "<Cmd>checkhealth mason<CR>",
    { desc = "Check Mason Health", silent = true, noremap = true })
-- Check Treesitter Health
vim.keymap.set("n", "<leader>cht", "<Cmd>checkhealth treesitter<CR>",
    { desc = "Check Treesitter Health", silent = true, noremap = true })
-- LSP Install Info
vim.keymap.set("n", "<leader>cI", "<Cmd>LspInstallInfo<CR>", { desc = "LSP Install Info", silent = true, noremap = true })
-- LSP Info
vim.keymap.set("n", "<leader>ci", "<Cmd>LspInfo<CR>", { desc = "LSP Info", silent = true, noremap = true })
-- Search Keymaps
vim.keymap.set("n", "<leader>cK", "<Cmd>Telescope keymaps<CR>",
    { desc = "Search Keymaps", silent = true, noremap = true })
-- Show Keymaps
vim.keymap.set("n", "<leader>ck", "<Cmd>WhichKey<CR>", { desc = "Show Keymaps", silent = true, noremap = true })
-- LSP Logs
vim.keymap.set("n", "<leader>cL", "<Cmd>LspLog<CR>", { desc = "LSP Logs", silent = true, noremap = true })
-- Plugin Logs
vim.keymap.set("n", "<leader>cl", "<Cmd>Lazy log<CR>", { desc = "Plugin Logs", silent = true, noremap = true })
-- Mason Update
vim.keymap.set("n", "<leader>cM", "<Cmd>MasonUpdate<CR>", { desc = "Mason Update", silent = true, noremap = true })
-- Mason
vim.keymap.set("n", "<leader>cm", "<Cmd>Mason<CR>", { desc = "Mason", silent = true, noremap = true })
-- Mason Logs
vim.keymap.set("n", "<leader>cml", "<Cmd>MasonLog<CR>", { desc = "Mason Logs", silent = true, noremap = true })
-- Mason Uninstall All
vim.keymap.set("n", "<leader>cmU", "<Cmd>MasonUninstallAll<CR>",
    { desc = "Mason Uninstall All", silent = true, noremap = true })
-- Mason Uninstall
vim.keymap.set("n", "<leader>cmu", "<Cmd>MasonUninstall<CR>", { desc = "Mason Uninstall", silent = true, noremap = true })
-- Search Notifications
vim.keymap.set("n", "<leader>cN", "<Cmd>Telescope notify<CR>",
    { desc = "Search Notifications", silent = true, noremap = true })
-- Show Notifications
vim.keymap.set("n", "<leader>cn", "<Cmd>Notifications<CR>",
    { desc = "Show Notifications", silent = true, noremap = true })
-- Search Options
vim.keymap.set("n", "<leader>cO", "<Cmd>Telescope vim_options<CR>",
    { desc = "Search Options", silent = true, noremap = true })
-- Options
vim.keymap.set("n", "<leader>co", "<Cmd>options<CR>", { desc = "Options", silent = true, noremap = true })
-- Profile Plugins
vim.keymap.set("n", "<leader>cP", "<Cmd>Lazy profile<CR>", { desc = "Profile Plugins", silent = true, noremap = true })
-- Plugin Manager
vim.keymap.set("n", "<leader>cp", "<Cmd>Lazy<CR>", { desc = "Plugin Manager", silent = true, noremap = true })
-- Restart LSP
vim.keymap.set("n", "<leader>cR", "<Cmd>LspRestart<CR>", { desc = "Restart LSP", silent = true, noremap = true })
-- Reload Config
vim.keymap.set("n", "<leader>cr", "<Cmd>source $MYVIMRC<CR>", { desc = "Reload Config", silent = true, noremap = true })
-- Start LSP
vim.keymap.set("n", "<leader>cS", "<Cmd>LspStart<CR>", { desc = "Start LSP", silent = true, noremap = true })
-- Sync Plugins
vim.keymap.set("n", "<leader>cs", "<Cmd>Lazy sync<CR>", { desc = "Sync Plugins", silent = true, noremap = true })
-- Load Session
vim.keymap.set("n", "<leader>csl", "<Cmd>source ~/.config/nvim/session.vim<CR>",
    { desc = "Load Session", silent = true, noremap = true })
-- Save Session
vim.keymap.set("n", "<leader>css", "<Cmd>mksession! ~/.config/nvim/session.vim<CR>",
    { desc = "Save Session", silent = true, noremap = true })
-- Update Treesitter Parsers
vim.keymap.set("n", "<leader>cT", "<Cmd>TSUpdate<CR>",
    { desc = "Update Treesitter Parsers", silent = true, noremap = true })
-- Restore Plugins
vim.keymap.set("n", "<leader>ct", "<Cmd>Lazy restore<CR>", { desc = "Restore Plugins", silent = true, noremap = true })
-- Treesitter Config Info
vim.keymap.set("n", "<leader>cTc", "<Cmd>TSConfigInfo<CR>",
    { desc = "Treesitter Config Info", silent = true, noremap = true })
-- Treesitter Install Info
vim.keymap.set("n", "<leader>cTi", "<Cmd>TSInstallInfo<CR>",
    { desc = "Treesitter Install Info", silent = true, noremap = true })
-- Treesitter Module Info
vim.keymap.set("n", "<leader>cTm", "<Cmd>TSModuleInfo<CR>",
    { desc = "Treesitter Module Info", silent = true, noremap = true })
-- Update Plugins (Wait)
vim.keymap.set("n", "<leader>cU", "<Cmd>Lazy update --wait<CR>",
    { desc = "Update Plugins (Wait)", silent = true, noremap = true })
-- Undo Tree
vim.keymap.set("n", "<leader>cu", "<Cmd>UndotreeToggle<CR>", { desc = "Undo Tree", silent = true, noremap = true })
-- Execute Lua File
vim.keymap.set("n", "<leader>cV", "<Cmd>luafile %<CR>", { desc = "Execute Lua File", silent = true, noremap = true })
-- Neovim Version
vim.keymap.set("n", "<leader>cv", "<Cmd>version<CR>", { desc = "Neovim Version", silent = true, noremap = true })
-- Version Details
vim.keymap.set("n", "<leader>cvi", "<Cmd>lua print(vim.inspect(vim.version()))<CR>",
    { desc = "Version Details", silent = true, noremap = true })
-- Show Working Directory
vim.keymap.set("n", "<leader>cw", "<Cmd>pwd<CR>", { desc = "Show Working Directory", silent = true, noremap = true })
-- Stop LSP
vim.keymap.set("n", "<leader>cX", "<Cmd>LspStop<CR>", { desc = "Stop LSP", silent = true, noremap = true })
-- Check for Updates
vim.keymap.set("n", "<leader>cx", "<Cmd>Lazy check<CR>", { desc = "Check for Updates", silent = true, noremap = true })
-- Clear Messages
vim.keymap.set("n", "<leader>cZ", "<Cmd>messages clear<CR>", { desc = "Clear Messages", silent = true, noremap = true })
-- Show Messages
vim.keymap.set("n", "<leader>cz", "<Cmd>messages<CR>", { desc = "Show Messages", silent = true, noremap = true })

-- ======================================================================
-- D
-- ======================================================================

-- Show diagnostic
vim.keymap.set("n", "<leader>d", "", { desc = "Show diagnostic", noremap = true })
vim.keymap.set("n", "<leader>dB", "", { noremap = true })
-- Toggle Breakpoint
vim.keymap.set("n", "<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
    { desc = "Toggle Breakpoint", silent = true, noremap = true })
-- Continue
vim.keymap.set("n", "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>",
    { desc = "Continue", silent = true, noremap = true })
vim.keymap.set("n", "<leader>dd",
    ":lua vim.ui.input({ prompt = 'Enter value: ' }, function(val) vim.ui.select({'A', 'B', 'C'}, { prompt = 'Pick one:' }, function(choice) print('Input:', val, 'Choice:', choice) end) end)<CR>",
    { silent = true, noremap = true })
vim.keymap.set("s", "<leader>de", "", { noremap = true })
vim.keymap.set("v", "<leader>de", "", { noremap = true })
vim.keymap.set("x", "<leader>de", "", { noremap = true })
vim.keymap.set("n", "<leader>de", "", { noremap = true })
-- Step Into
vim.keymap.set("n", "<leader>di", "<Cmd>lua require'dap'.step_into()<CR>",
    { desc = "Step Into", silent = true, noremap = true })
-- Run Last
vim.keymap.set("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>",
    { desc = "Run Last", silent = true, noremap = true })
-- Step Out
vim.keymap.set("n", "<leader>dO", "<Cmd>lua require'dap'.step_out()<CR>",
    { desc = "Step Out", silent = true, noremap = true })
-- Step Over
vim.keymap.set("n", "<leader>do", "<Cmd>lua require'dap'.step_over()<CR>",
    { desc = "Step Over", silent = true, noremap = true })
-- Toggle REPL
vim.keymap.set("n", "<leader>dr", "<Cmd>lua require'dap'.repl.toggle()<CR>",
    { desc = "Toggle REPL", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ds",
    ":lua vim.ui.select({'Option 1', 'Option 2', 'Option 3'}, { prompt = 'Pick an option:' }, function(choice) print('You chose:', choice) end)<CR>",
    { silent = true, noremap = true })
-- Terminate
vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'dap'.terminate()<CR>",
    { desc = "Terminate", silent = true, noremap = true })
-- Toggle UI
vim.keymap.set("n", "<leader>du", "<Cmd>lua require'dapui'.toggle()<CR>",
    { desc = "Toggle UI", silent = true, noremap = true })

-- ======================================================================
-- E
-- ======================================================================

-- Toggle File Explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer", noremap = true })

-- ======================================================================
-- F
-- ======================================================================

-- Fuzzy Find in Buffer
vim.keymap.set("n", "<leader>f*", "<Cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "Fuzzy Find in Buffer", silent = true, noremap = true })
-- Find Config Files
vim.keymap.set("n", "<leader>f.", "<Cmd>Telescope find_files cwd=~/.config/nvim<CR>",
    { desc = "Find Config Files", silent = true, noremap = true })
-- Search History
vim.keymap.set("n", "<leader>f/", "<Cmd>Telescope search_history<CR>",
    { desc = "Search History", silent = true, noremap = true })
-- Command History
vim.keymap.set("n", "<leader>f:", "<Cmd>Telescope command_history<CR>",
    { desc = "Command History", silent = true, noremap = true })
vim.keymap.set("n", "<leader>f_", "", { silent = true, noremap = true })
-- Autocommands
vim.keymap.set("n", "<leader>fa", "<Cmd>Telescope autocommands<CR>",
    { desc = "Autocommands", silent = true, noremap = true })
-- All Buffers
vim.keymap.set("n", "<leader>fB", "<Cmd>Telescope buffers show_all_buffers=true<CR>",
    { desc = "All Buffers", silent = true, noremap = true })
-- Buffers
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Buffers", silent = true, noremap = true })
-- Commands
vim.keymap.set("n", "<leader>fc", "<Cmd>Telescope commands<CR>", { desc = "Commands", silent = true, noremap = true })
-- Buffer Diagnostics
vim.keymap.set("n", "<leader>fD", "<Cmd>Telescope diagnostics bufnr=0<CR>",
    { desc = "Buffer Diagnostics", silent = true, noremap = true })
-- Diagnostics
vim.keymap.set("n", "<leader>fd", "<Cmd>Telescope diagnostics<CR>",
    { desc = "Diagnostics", silent = true, noremap = true })
-- File Browser (cwd)
 
    { desc = "File Browser (cwd)", silent = true, noremap = true })
-- File Browser
vim.keymap.set("n", "<leader>fe", "<Cmd>Telescope file_browser<CR>",
    { desc = "File Browser", silent = true, noremap = true })
-- Find All Files (Hidden)
vim.keymap.set("n", "<leader>fF", "<Cmd>Telescope find_files hidden=true no_ignore=true<CR>",
    { desc = "Find All Files (Hidden)", silent = true, noremap = true })
-- Find Files
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find Files", silent = true, noremap = true })
-- Live Grep (Hidden)
vim.keymap.set("n", "<leader>fG", "<Cmd>Telescope live_grep additional_args={'--hidden'}<CR>",
    { desc = "Live Grep (Hidden)", silent = true, noremap = true })
-- Live Grep
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Live Grep", silent = true, noremap = true })
-- Git Branches
vim.keymap.set("n", "<leader>fgB", "<Cmd>Telescope git_branches<CR>",
    { desc = "Git Branches", silent = true, noremap = true })
-- Git Buffer Commits
vim.keymap.set("n", "<leader>fgb", "<Cmd>Telescope git_bcommits<CR>",
    { desc = "Git Buffer Commits", silent = true, noremap = true })
-- Git Commits
vim.keymap.set("n", "<leader>fgc", "<Cmd>Telescope git_commits<CR>",
    { desc = "Git Commits", silent = true, noremap = true })
-- Git Stash
vim.keymap.set("n", "<leader>fgS", "<Cmd>Telescope git_stash<CR>", { desc = "Git Stash", silent = true, noremap = true })
-- Git Status
vim.keymap.set("n", "<leader>fgs", "<Cmd>Telescope git_status<CR>",
    { desc = "Git Status", silent = true, noremap = true })
-- Highlights
vim.keymap.set("n", "<leader>fH", "<Cmd>Telescope highlights<CR>", { desc = "Highlights", silent = true, noremap = true })
-- Help Tags
vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", { desc = "Help Tags", silent = true, noremap = true })
-- Incoming Calls
vim.keymap.set("n", "<leader>fI", "<Cmd>Telescope lsp_incoming_calls<CR>",
    { desc = "Incoming Calls", silent = true, noremap = true })
-- Implementations
vim.keymap.set("n", "<leader>fi", "<Cmd>Telescope lsp_implementations<CR>",
    { desc = "Implementations", silent = true, noremap = true })
-- Jumplist
vim.keymap.set("n", "<leader>fj", "<Cmd>Telescope jumplist<CR>", { desc = "Jumplist", silent = true, noremap = true })
-- Keymaps
vim.keymap.set("n", "<leader>fk", "<Cmd>Telescope keymaps<CR>", { desc = "Keymaps", silent = true, noremap = true })
-- Location List
vim.keymap.set("n", "<leader>fl", "<Cmd>Telescope loclist<CR>", { desc = "Location List", silent = true, noremap = true })
-- Marks
vim.keymap.set("n", "<leader>fm", "<Cmd>Telescope marks<CR>", { desc = "Marks", silent = true, noremap = true })
-- New File
vim.keymap.set("n", "<leader>fn", "<Cmd>enew<CR>", { desc = "New File", silent = true, noremap = true })
-- Outgoing Calls
vim.keymap.set("n", "<leader>fO", "<Cmd>Telescope lsp_outgoing_calls<CR>",
    { desc = "Outgoing Calls", silent = true, noremap = true })
-- Vim Options
vim.keymap.set("n", "<leader>fo", "<Cmd>Telescope vim_options<CR>",
    { desc = "Vim Options", silent = true, noremap = true })
-- Projects
vim.keymap.set("n", "<leader>fp", "<Cmd>Telescope projects<CR>", { desc = "Projects", silent = true, noremap = true })
-- Quickfix
vim.keymap.set("n", "<leader>fq", "<Cmd>Telescope quickfix<CR>", { desc = "Quickfix", silent = true, noremap = true })
-- References
vim.keymap.set("n", "<leader>fR", "<Cmd>Telescope lsp_references<CR>",
    { desc = "References", silent = true, noremap = true })
-- Recent Files
vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Recent Files", silent = true, noremap = true })
-- Workspace Symbols
vim.keymap.set("n", "<leader>fS", "<Cmd>Telescope lsp_workspace_symbols<CR>",
    { desc = "Workspace Symbols", silent = true, noremap = true })
-- Document Symbols
vim.keymap.set("n", "<leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>",
    { desc = "Document Symbols", silent = true, noremap = true })
-- Type Definitions
vim.keymap.set("n", "<leader>fT", "<Cmd>Telescope lsp_type_definitions<CR>",
    { desc = "Type Definitions", silent = true, noremap = true })
-- Themes
vim.keymap.set("n", "<leader>ft", "<Cmd>Telescope colorscheme<CR>", { desc = "Themes", silent = true, noremap = true })
-- Treesitter Symbols
vim.keymap.set("n", "<leader>fts", "<Cmd>Telescope treesitter<CR>",
    { desc = "Treesitter Symbols", silent = true, noremap = true })
vim.keymap.set("n", "<leader>fu", ":lua require('telescope').extensions.undo.undo()<CR>",
    { silent = true, noremap = true })
-- Find Word (Input)
vim.keymap.set("n", "<leader>fW", "<Cmd>Telescope grep_string search=<CR>",
    { desc = "Find Word (Input)", silent = true, noremap = true })
-- Find Word Under Cursor
vim.keymap.set("n", "<leader>fw", "<Cmd>Telescope grep_string<CR>",
    { desc = "Find Word Under Cursor", silent = true, noremap = true })
-- Resume Last Search
vim.keymap.set("n", "<leader>fz", "<Cmd>Telescope resume<CR>",
    { desc = "Resume Last Search", silent = true, noremap = true })

-- ======================================================================
-- G
-- ======================================================================

-- Snipe: Open buffer menu
vim.keymap.set("n", "<leader>gB", "", { desc = "Snipe: Open buffer menu", silent = true, noremap = true })
-- Blame
vim.keymap.set("n", "<leader>gb", "<Cmd>Git blame<CR>", { desc = "Blame", silent = true, noremap = true })
-- Toggle comment
vim.keymap.set("x", "<leader>gc", "", { desc = "Toggle comment", silent = true, noremap = true })
-- Commit
vim.keymap.set("n", "<leader>gc", "<Cmd>Git commit<CR>", { desc = "Commit", silent = true, noremap = true })
-- Toggle comment
vim.keymap.set("v", "<leader>gc", "", { desc = "Toggle comment", silent = true, noremap = true })
-- Toggle comment
vim.keymap.set("s", "<leader>gc", "", { desc = "Toggle comment", silent = true, noremap = true })
-- Snipe: Open buffer menu to delete
vim.keymap.set("n", "<leader>gD", "", { desc = "Snipe: Open buffer menu to delete", silent = true, noremap = true })
-- Diff
vim.keymap.set("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>", { desc = "Diff", silent = true, noremap = true })
-- 👁️ Preview Hunk
vim.keymap.set("n", "<leader>gh", "<Cmd>Gitsigns preview_hunk<CR>", { desc = "👁️ Preview Hunk", noremap = true })
-- Previous Hunk
vim.keymap.set("n", "<leader>ghN", "<Cmd>Gitsigns prev_hunk<CR>",
    { desc = "Previous Hunk", silent = true, noremap = true })
-- Next Hunk
vim.keymap.set("n", "<leader>ghn", "<Cmd>Gitsigns next_hunk<CR>", { desc = "Next Hunk", silent = true, noremap = true })
-- Preview Hunk
vim.keymap.set("n", "<leader>ghp", "<Cmd>Gitsigns preview_hunk<CR>",
    { desc = "Preview Hunk", silent = true, noremap = true })
-- Reset Hunk
vim.keymap.set("n", "<leader>ghr", "<Cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Hunk", silent = true, noremap = true })
-- Stage Hunk
vim.keymap.set("n", "<leader>ghs", "<Cmd>Gitsigns stage_hunk<CR>", { desc = "Stage Hunk", silent = true, noremap = true })
-- Undo Stage
vim.keymap.set("n", "<leader>ghu", "<Cmd>Gitsigns undo_stage_hunk<CR>",
    { desc = "Undo Stage", silent = true, noremap = true })
-- Log
vim.keymap.set("n", "<leader>gl", "<Cmd>Git log<CR>", { desc = "Log", silent = true, noremap = true })
-- Pull
vim.keymap.set("n", "<leader>gP", "<Cmd>Git pull<CR>", { desc = "Pull", silent = true, noremap = true })
-- Push
vim.keymap.set("n", "<leader>gp", "<Cmd>Git push<CR>", { desc = "Push", silent = true, noremap = true })
-- ♻️ Reset Hunk
vim.keymap.set("n", "<leader>gr", "<Cmd>Gitsigns reset_hunk<CR>", { desc = "♻️ Reset Hunk", noremap = true })
-- Status
vim.keymap.set("n", "<leader>gs", "<Cmd>Git status<CR>", { desc = "Status", silent = true, noremap = true })
-- Snipe: Jump to buffer 1
vim.keymap.set("n", "<leader>gS1", "", { desc = "Snipe: Jump to buffer 1", silent = true, noremap = true })
-- Snipe: Jump to buffer 2
vim.keymap.set("n", "<leader>gS2", "", { desc = "Snipe: Jump to buffer 2", silent = true, noremap = true })
-- Snipe: Jump to buffer 3
vim.keymap.set("n", "<leader>gS3", "", { desc = "Snipe: Jump to buffer 3", silent = true, noremap = true })
-- Snipe: Jump to buffer 4
vim.keymap.set("n", "<leader>gS4", "", { desc = "Snipe: Jump to buffer 4", silent = true, noremap = true })
-- Snipe: Jump to buffer 5
vim.keymap.set("n", "<leader>gS5", "", { desc = "Snipe: Jump to buffer 5", silent = true, noremap = true })

-- ======================================================================
-- L
-- ======================================================================

-- Range Code Action
vim.keymap.set("v", "<leader>lA", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
    { desc = "Range Code Action", silent = true, noremap = true })
-- Range Code Action
vim.keymap.set("s", "<leader>lA", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
    { desc = "Range Code Action", silent = true, noremap = true })
-- Range Code Action
vim.keymap.set("x", "<leader>lA", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
    { desc = "Range Code Action", silent = true, noremap = true })
-- Code Action
vim.keymap.set("n", "<leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>",
    { desc = "Code Action", silent = true, noremap = true })
-- Start LSP
vim.keymap.set("n", "<leader>lC", "<Cmd>LspStart<CR>", { desc = "Start LSP", silent = true, noremap = true })
-- Restart LSP
vim.keymap.set("n", "<leader>lc", "<Cmd>LspRestart<CR>", { desc = "Restart LSP", silent = true, noremap = true })
-- Incoming Calls
vim.keymap.set("n", "<leader>lci", "<Cmd>Telescope lsp_incoming_calls<CR>",
    { desc = "Incoming Calls", silent = true, noremap = true })
-- Run CodeLens
vim.keymap.set("n", "<leader>lcl", "<Cmd>lua vim.lsp.codelens.run()<CR>",
    { desc = "Run CodeLens", silent = true, noremap = true })
-- Outgoing Calls
vim.keymap.set("n", "<leader>lco", "<Cmd>Telescope lsp_outgoing_calls<CR>",
    { desc = "Outgoing Calls", silent = true, noremap = true })
-- Refresh CodeLens
vim.keymap.set("n", "<leader>lcr", "<Cmd>lua vim.lsp.codelens.refresh()<CR>",
    { desc = "Refresh CodeLens", silent = true, noremap = true })
-- Go to Declaration
vim.keymap.set("n", "<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>",
    { desc = "Go to Declaration", silent = true, noremap = true })
-- Go to Definition
vim.keymap.set("n", "<leader>ld", "<Cmd>lua vim.lsp.buf.definition()<CR>",
    { desc = "Go to Definition", silent = true, noremap = true })
-- Cursor Diagnostics (Float)
vim.keymap.set("n", "<leader>ldC", "<Cmd>lua vim.diagnostic.open_float(nil, { focus=false, scope='cursor' })<CR>",
    { desc = "Cursor Diagnostics (Float)", silent = true, noremap = true })
-- Disable Diagnostics
vim.keymap.set("n", "<leader>ldd", "<Cmd>lua vim.diagnostic.disable()<CR>",
    { desc = "Disable Diagnostics", silent = true, noremap = true })
-- Enable Diagnostics
vim.keymap.set("n", "<leader>ldE", "<Cmd>lua vim.diagnostic.enable()<CR>",
    { desc = "Enable Diagnostics", silent = true, noremap = true })
-- Line Diagnostics (Float)
vim.keymap.set("n", "<leader>ldf", "<Cmd>lua vim.diagnostic.open_float(nil, { focus=false, scope='line' })<CR>",
    { desc = "Line Diagnostics (Float)", silent = true, noremap = true })
-- Toggle Diagnostics
vim.keymap.set("n", "<leader>ldt", "<Cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",
    { desc = "Toggle Diagnostics", silent = true, noremap = true })
-- Clear Highlight
vim.keymap.set("n", "<leader>ldU", "<Cmd>lua vim.lsp.buf.clear_references()<CR>",
    { desc = "Clear Highlight", silent = true, noremap = true })
-- Highlight Symbol
vim.keymap.set("n", "<leader>ldu", "<Cmd>lua vim.lsp.buf.document_highlight()<CR>",
    { desc = "Highlight Symbol", silent = true, noremap = true })
-- Diagnostics to Location List
vim.keymap.set("n", "<leader>lE", "<Cmd>lua vim.diagnostic.setloclist()<CR>",
    { desc = "Diagnostics to Location List", silent = true, noremap = true })
-- Line Diagnostics
vim.keymap.set("n", "<leader>le", "<Cmd>lua vim.diagnostic.open_float()<CR>",
    { desc = "Line Diagnostics", silent = true, noremap = true })
-- Format (Async)
vim.keymap.set("n", "<leader>lF", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>",
    { desc = "Format (Async)", silent = true, noremap = true })
-- Format Document
vim.keymap.set("n", "<leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>",
    { desc = "Format Document", silent = true, noremap = true })
-- Toggle Format on Save
vim.keymap.set("n", "<leader>lfs", "<Cmd>lua vim.g.format_on_save = not vim.g.format_on_save<CR>",
    { desc = "Toggle Format on Save", silent = true, noremap = true })
-- References (Telescope)
vim.keymap.set("n", "<leader>lG", "<Cmd>Telescope lsp_references<CR>",
    { desc = "References (Telescope)", silent = true, noremap = true })
-- Definitions (Telescope)
vim.keymap.set("n", "<leader>lg", "<Cmd>Telescope lsp_definitions<CR>",
    { desc = "Definitions (Telescope)", silent = true, noremap = true })
-- Hover (Jump In)
vim.keymap.set("n", "<leader>lH", "<Cmd>lua vim.lsp.buf.hover()<CR><Cmd>lua vim.lsp.buf.hover()<CR>",
    { desc = "Hover (Jump In)", silent = true, noremap = true })
-- Hover Documentation
vim.keymap.set("n", "<leader>lh", "<Cmd>lua vim.lsp.buf.hover()<CR>",
    { desc = "Hover Documentation", silent = true, noremap = true })
-- Implementations (Telescope)
vim.keymap.set("n", "<leader>lI", "<Cmd>Telescope lsp_implementations<CR>",
    { desc = "Implementations (Telescope)", silent = true, noremap = true })
-- Go to Implementation
vim.keymap.set("n", "<leader>li", "<Cmd>lua vim.lsp.buf.implementation()<CR>",
    { desc = "Go to Implementation", silent = true, noremap = true })
-- Toggle Inlay Hints
vim.keymap.set("n", "<leader>lih", "<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
    { desc = "Toggle Inlay Hints", silent = true, noremap = true })
-- Stop LSP
vim.keymap.set("n", "<leader>lk", "<Cmd>LspStop<CR>", { desc = "Stop LSP", silent = true, noremap = true })
-- LSP Info
vim.keymap.set("n", "<leader>lL", "<Cmd>LspInfo<CR>", { desc = "LSP Info", silent = true, noremap = true })
-- LSP Logs
vim.keymap.set("n", "<leader>ll", "<Cmd>LspLog<CR>", { desc = "LSP Logs", silent = true, noremap = true })
-- Next Error
vim.keymap.set("n", "<leader>lN", "<Cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
    { desc = "Next Error", silent = true, noremap = true })
-- Next Diagnostic
vim.keymap.set("n", "<leader>ln", "<Cmd>lua vim.diagnostic.goto_next()<CR>",
    { desc = "Next Diagnostic", silent = true, noremap = true })
-- Dynamic Workspace Symbols
vim.keymap.set("n", "<leader>lO", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
    { desc = "Dynamic Workspace Symbols", silent = true, noremap = true })
-- Workspace Symbols
vim.keymap.set("n", "<leader>lo", "<Cmd>Telescope lsp_workspace_symbols<CR>",
    { desc = "Workspace Symbols", silent = true, noremap = true })
-- Previous Error
vim.keymap.set("n", "<leader>lP", "<Cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
    { desc = "Previous Error", silent = true, noremap = true })
-- Previous Diagnostic
vim.keymap.set("n", "<leader>lp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>",
    { desc = "Previous Diagnostic", silent = true, noremap = true })
-- Diagnostics to Quickfix
vim.keymap.set("n", "<leader>lq", "<Cmd>lua vim.diagnostic.setqflist()<CR>",
    { desc = "Diagnostics to Quickfix", silent = true, noremap = true })
-- Quick Fix
vim.keymap.set("n", "<leader>lqa", "<Cmd>lua vim.lsp.buf.code_action({ context = { only = {'quickfix'} } })<CR>",
    { desc = "Quick Fix", silent = true, noremap = true })
-- Find References
vim.keymap.set("n", "<leader>lR", "<Cmd>lua vim.lsp.buf.references()<CR>",
    { desc = "Find References", silent = true, noremap = true })
-- Rename Symbol
vim.keymap.set("n", "<leader>lr", "<Cmd>lua vim.lsp.buf.rename()<CR>",
    { desc = "Rename Symbol", silent = true, noremap = true })
-- Document Symbols
vim.keymap.set("n", "<leader>lS", "<Cmd>Telescope lsp_document_symbols<CR>",
    { desc = "Document Symbols", silent = true, noremap = true })
-- Signature Help
vim.keymap.set("n", "<leader>ls", "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
    { desc = "Signature Help", silent = true, noremap = true })
-- Force Refresh Semantic Tokens
vim.keymap.set("n", "<leader>lsf", "<Cmd>lua vim.lsp.semantic_tokens.force_refresh()<CR>",
    { desc = "Force Refresh Semantic Tokens", silent = true, noremap = true })
-- Type Definitions (Telescope)
vim.keymap.set("n", "<leader>lT", "<Cmd>Telescope lsp_type_definitions<CR>",
    { desc = "Type Definitions (Telescope)", silent = true, noremap = true })
-- Go to Type Definition
vim.keymap.set("n", "<leader>lt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>",
    { desc = "Go to Type Definition", silent = true, noremap = true })
-- Close Trouble
vim.keymap.set("n", "<leader>lTc", "<Cmd>Trouble close<CR>", { desc = "Close Trouble", silent = true, noremap = true })
-- Document Diagnostics
vim.keymap.set("n", "<leader>lTD", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    { desc = "Document Diagnostics", silent = true, noremap = true })
-- LSP Definitions
vim.keymap.set("n", "<leader>lTd", "<Cmd>Trouble lsp_definitions toggle<CR>",
    { desc = "LSP Definitions", silent = true, noremap = true })
-- LSP Implementations
vim.keymap.set("n", "<leader>lTi", "<Cmd>Trouble lsp_implementations toggle<CR>",
    { desc = "LSP Implementations", silent = true, noremap = true })
-- Location List
vim.keymap.set("n", "<leader>lTL", "<Cmd>Trouble loclist toggle<CR>",
    { desc = "Location List", silent = true, noremap = true })
-- Quickfix List
vim.keymap.set("n", "<leader>lTQ", "<Cmd>Trouble quickfix toggle<CR>",
    { desc = "Quickfix List", silent = true, noremap = true })
-- LSP References
vim.keymap.set("n", "<leader>lTR", "<Cmd>Trouble lsp toggle focus=false<CR>",
    { desc = "LSP References", silent = true, noremap = true })
-- Refresh Trouble
vim.keymap.set("n", "<leader>lTr", "<Cmd>Trouble refresh<CR>",
    { desc = "Refresh Trouble", silent = true, noremap = true })
-- Symbols
vim.keymap.set("n", "<leader>lTS", "<Cmd>Trouble symbols toggle focus=false<CR>",
    { desc = "Symbols", silent = true, noremap = true })
-- Toggle Trouble
vim.keymap.set("n", "<leader>lTT", "<Cmd>Trouble diagnostics toggle<CR>",
    { desc = "Toggle Trouble", silent = true, noremap = true })
-- LSP Type Definitions
vim.keymap.set("n", "<leader>lTt", "<Cmd>Trouble lsp_type_definitions toggle<CR>",
    { desc = "LSP Type Definitions", silent = true, noremap = true })
-- Workspace Diagnostics
vim.keymap.set("n", "<leader>lTW", "<Cmd>Trouble diagnostics toggle<CR>",
    { desc = "Workspace Diagnostics", silent = true, noremap = true })
-- Organize Imports
vim.keymap.set("n", "<leader>lui",
    "<Cmd>lua vim.lsp.buf.code_action({ context = { only = {'source.organizeImports'} }, apply = true })<CR>",
    { desc = "Organize Imports", silent = true, noremap = true })
-- Format Selection
vim.keymap.set("s", "<leader>lv", "<Cmd>lua vim.lsp.buf.format()<CR>",
    { desc = "Format Selection", silent = true, noremap = true })
-- Format Selection
vim.keymap.set("x", "<leader>lv", "<Cmd>lua vim.lsp.buf.format()<CR>",
    { desc = "Format Selection", silent = true, noremap = true })
-- Format Selection
vim.keymap.set("v", "<leader>lv", "<Cmd>lua vim.lsp.buf.format()<CR>",
    { desc = "Format Selection", silent = true, noremap = true })
-- Workspace Diagnostics
vim.keymap.set("n", "<leader>lw", "<Cmd>Trouble diagnostics toggle<CR>",
    { desc = "Workspace Diagnostics", noremap = true })
-- Add Workspace Folder
vim.keymap.set("n", "<leader>lwa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    { desc = "Add Workspace Folder", silent = true, noremap = true })
-- Clear References
vim.keymap.set("n", "<leader>lwc", "<Cmd>lua vim.lsp.buf.clear_references()<CR>",
    { desc = "Clear References", silent = true, noremap = true })
-- List Workspace Folders
vim.keymap.set("n", "<leader>lwl", "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    { desc = "List Workspace Folders", silent = true, noremap = true })
-- Remove Workspace Folder
vim.keymap.set("n", "<leader>lwr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    { desc = "Remove Workspace Folder", silent = true, noremap = true })
-- Buffer Diagnostics (Telescope)
vim.keymap.set("n", "<leader>lX", "<Cmd>Telescope diagnostics bufnr=0<CR>",
    { desc = "Buffer Diagnostics (Telescope)", silent = true, noremap = true })
-- Diagnostics (Telescope)
vim.keymap.set("n", "<leader>lx", "<Cmd>Telescope diagnostics<CR>",
    { desc = "Diagnostics (Telescope)", silent = true, noremap = true })
-- Folding Range
vim.keymap.set("n", "<leader>lz", "<Cmd>lua vim.lsp.buf.foldingRange()<CR>",
    { desc = "Folding Range", silent = true, noremap = true })

-- ======================================================================
-- M
-- ======================================================================

-- Move block to line
vim.keymap.set("v", "<leader>m", ":MoveBlock<CR>", { desc = "Move block to line", noremap = true })
-- Move block to line
vim.keymap.set("s", "<leader>m", ":MoveBlock<CR>", { desc = "Move block to line", noremap = true })
-- Move block to line
vim.keymap.set("x", "<leader>m", ":MoveBlock<CR>", { desc = "Move block to line", noremap = true })
-- CD to File Dir
vim.keymap.set("n", "<leader>mc", "<Cmd>cd %:p:h<CR>", { desc = "CD to File Dir", silent = true, noremap = true })
-- Notification History
vim.keymap.set("n", "<leader>mh", "<Cmd>Telescope notify<CR>",
    { desc = "Notification History", silent = true, noremap = true })
-- Lazy Plugin Manager
vim.keymap.set("n", "<leader>ml", "<Cmd>Lazy<CR>", { desc = "Lazy Plugin Manager", silent = true, noremap = true })
-- Show Messages
vim.keymap.set("n", "<leader>mm", "<Cmd>messages<CR>", { desc = "Show Messages", silent = true, noremap = true })
-- New File
vim.keymap.set("n", "<leader>mn", "<Cmd>enew<CR>", { desc = "New File", silent = true, noremap = true })
-- Paste Before from Clipboard
vim.keymap.set("n", "<leader>mP", "\"+P", { desc = "Paste Before from Clipboard", silent = true, noremap = true })
-- Paste from Clipboard
vim.keymap.set("n", "<leader>mp", "\"+p", { desc = "Paste from Clipboard", silent = true, noremap = true })
-- Yank All
vim.keymap.set("n", "<leader>my", "<Cmd>%y+<CR>", { desc = "Yank All", silent = true, noremap = true })

-- ======================================================================
-- N
-- ======================================================================

-- Noice: Dismiss all
vim.keymap.set("n", "<leader>nd", "<Cmd>Noice dismiss<CR>",
    { desc = "Noice: Dismiss all", silent = true, noremap = true })
-- Noice: Show errors
vim.keymap.set("n", "<leader>ne", "<Cmd>Noice errors<CR>", { desc = "Noice: Show errors", silent = true, noremap = true })
-- Noice: Message history
vim.keymap.set("n", "<leader>nh", "<Cmd>Noice history<CR>",
    { desc = "Noice: Message history", silent = true, noremap = true })
-- Noice: Last message
vim.keymap.set("n", "<leader>nl", "<Cmd>Noice last<CR>", { desc = "Noice: Last message", silent = true, noremap = true })
-- Noice: Open in Telescope
vim.keymap.set("n", "<leader>nt", "<Cmd>Noice telescope<CR>",
    { desc = "Noice: Open in Telescope", silent = true, noremap = true })

-- ======================================================================
-- P
-- ======================================================================

-- Add Current Dir as Workspace
vim.keymap.set("n", "<leader>pa", ":WorkspacesAdd<CR>", { desc = "Add Current Dir as Workspace", noremap = true })
-- Delete Session
vim.keymap.set("n", "<leader>pd", ":SessionDelete<CR>", { desc = "Delete Session", noremap = true })
-- Load Last Session
vim.keymap.set("n", "<leader>pl", ":SessionRestore<CR>", { desc = "Load Last Session", noremap = true })
-- Remove Workspace
vim.keymap.set("n", "<leader>pr", ":WorkspacesRemove<CR>", { desc = "Remove Workspace", noremap = true })
-- Save Session
vim.keymap.set("n", "<leader>ps", ":SessionSave<CR>", { desc = "Save Session", noremap = true })
-- Open Workspaces
vim.keymap.set("n", "<leader>pw", ":WorkspacesOpen<CR>", { desc = "Open Workspaces", noremap = true })

-- ======================================================================
-- Q
-- ======================================================================

-- ❌ Quit
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "❌ Quit", noremap = true })
-- ❌ Quit All
vim.keymap.set("n", "<leader>qa", "<Cmd>qa<CR>", { desc = "❌ Quit All", noremap = true })
-- Force Quit All
vim.keymap.set("n", "<leader>qF", "<Cmd>qa!<CR>", { desc = "Force Quit All", silent = true, noremap = true })
-- Force Quit
vim.keymap.set("n", "<leader>qf", "<Cmd>q!<CR>", { desc = "Force Quit", silent = true, noremap = true })
-- Quit All
vim.keymap.set("n", "<leader>qQ", "<Cmd>qa<CR>", { desc = "Quit All", silent = true, noremap = true })
-- Quit
vim.keymap.set("n", "<leader>qq", "<Cmd>q<CR>", { desc = "Quit", silent = true, noremap = true })
-- Save All & Quit
vim.keymap.set("n", "<leader>qW", "<Cmd>wqa<CR>", { desc = "Save All & Quit", silent = true, noremap = true })
-- Save & Quit
vim.keymap.set("n", "<leader>qw", "<Cmd>wq<CR>", { desc = "Save & Quit", silent = true, noremap = true })

-- ======================================================================
-- R
-- ======================================================================

-- Replace in whole file
vim.keymap.set("n", "<leader>ra", ":lua SubstituteAll()<CR>", { desc = "Replace in whole file", noremap = true })
-- Refresh File Explorer
vim.keymap.set("n", "<leader>re", ":NvimTreeRefresh<CR>", { desc = "Refresh File Explorer", noremap = true })
-- Replace in matching lines
vim.keymap.set("n", "<leader>rm", ":lua SubstituteMatchingLines()<CR>",
    { desc = "Replace in matching lines", noremap = true })
vim.keymap.set("n", "<leader>rn", "", { silent = true, noremap = true })
-- Replace in selection
vim.keymap.set("x", "<leader>rs", ":s///g<Left><Left>", { desc = "Replace in selection", noremap = true })
-- Replace in selection
vim.keymap.set("v", "<leader>rs", ":s///g<Left><Left>", { desc = "Replace in selection", noremap = true })
-- Range substitute
vim.keymap.set("n", "<leader>rs", ":lua SubstituteRange()<CR>", { desc = "Range substitute", noremap = true })
-- Replace in selection
vim.keymap.set("s", "<leader>rs", ":s///g<Left><Left>", { desc = "Replace in selection", noremap = true })

-- ======================================================================
-- S
-- ======================================================================

-- Snacks: Buffer info
vim.keymap.set("n", "<leader>sB", "", { desc = "Snacks: Buffer info", silent = true, noremap = true })
-- Snacks: Buffer picker
vim.keymap.set("n", "<leader>sb", "", { desc = "Snacks: Buffer picker", silent = true, noremap = true })
-- Delete Session
vim.keymap.set("n", "<leader>Sd", "<Cmd>SessionDelete<CR>", { desc = "Delete Session", silent = true, noremap = true })
-- Snacks: Close notification history
vim.keymap.set("n", "<leader>sD", "", { desc = "Snacks: Close notification history", silent = true, noremap = true })
-- Snacks: Dismiss notifications
vim.keymap.set("n", "<leader>sd", "", { desc = "Snacks: Dismiss notifications", silent = true, noremap = true })
-- Find in Buffer
vim.keymap.set("n", "<leader>sf", "<Cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "Find in Buffer", silent = true, noremap = true })
-- Snacks: Grep picker
vim.keymap.set("n", "<leader>sg", "", { desc = "Snacks: Grep picker", silent = true, noremap = true })
-- Snacks: Toggle search highlighting
vim.keymap.set("n", "<leader>sh", "<Cmd>set hlsearch!<CR>",
    { desc = "Snacks: Toggle search highlighting", silent = true, noremap = true })
-- Snacks: Input prompt
vim.keymap.set("n", "<leader>si", "", { desc = "Snacks: Input prompt", silent = true, noremap = true })
-- Load Session
vim.keymap.set("n", "<leader>Sl", "<Cmd>SessionLoad<CR>", { desc = "Load Session", silent = true, noremap = true })
-- 📂 Load Session
vim.keymap.set("n", "<leader>sl", "<Cmd>SessionLoad<CR>", { desc = "📂 Load Session", noremap = true })
-- Snacks: Show notification history
vim.keymap.set("n", "<leader>sn", "", { desc = "Snacks: Show notification history", silent = true, noremap = true })
-- Snacks: Test progress
vim.keymap.set("n", "<leader>sp", "", { desc = "Snacks: Test progress", silent = true, noremap = true })
-- Restore Session
vim.keymap.set("n", "<leader>Sr", "<Cmd>SessionRestore<CR>", { desc = "Restore Session", silent = true, noremap = true })
-- Replace All
vim.keymap.set("n", "<leader>sR", ":%s//g<Left><Left>", { desc = "Replace All", silent = true, noremap = true })
-- Replace Word
vim.keymap.set("n", "<leader>sr", ":%s/\<lt><C-R><C-W>\>//g<Left><Left>",
    { desc = "Replace Word", silent = true, noremap = true })
-- Save Session
vim.keymap.set("n", "<leader>Ss", "<Cmd>SessionSave<CR>", { desc = "Save Session", silent = true, noremap = true })
-- Search Text
vim.keymap.set("n", "<leader>ss", "<Cmd>Telescope live_grep<CR>", { desc = "Search Text", silent = true, noremap = true })
-- Snacks: Toggle word highlighting
vim.keymap.set("n", "<leader>sw", "", { desc = "Snacks: Toggle word highlighting", silent = true, noremap = true })

-- ======================================================================
-- T
-- ======================================================================

-- Previous Tab
vim.keymap.set("n", "<leader>t[", "<Cmd>tabprevious<CR>", { desc = "Previous Tab", silent = true, noremap = true })
-- Next Tab
vim.keymap.set("n", "<leader>t]", "<Cmd>tabnext<CR>", { desc = "Next Tab", silent = true, noremap = true })
-- Close Tab
vim.keymap.set("n", "<leader>tc", "<Cmd>tabclose<CR>", { desc = "Close Tab", silent = true, noremap = true })
-- Tree Find Current File
vim.keymap.set("n", "<leader>tE1", "<Cmd>NvimTreeFindFile<CR>",
    { desc = "Tree Find Current File", silent = true, noremap = true })
-- Tree Focus Explorer
vim.keymap.set("n", "<leader>tE2", "<Cmd>NvimTreeFocus<CR>",
    { desc = "Tree Focus Explorer", silent = true, noremap = true })
-- Tree Close Explorer
vim.keymap.set("n", "<leader>tEC", "<Cmd>NvimTreeClose<CR>",
    { desc = "Tree Close Explorer", silent = true, noremap = true })
-- Tree Collapse All
vim.keymap.set("n", "<leader>tEc", "<Cmd>NvimTreeCollapse<CR>",
    { desc = "Tree Collapse All", silent = true, noremap = true })
-- Tree Collapse Keep Buffers
vim.keymap.set("n", "<leader>tEk", "<Cmd>NvimTreeCollapseKeepBuffers<CR>",
    { desc = "Tree Collapse Keep Buffers", silent = true, noremap = true })
-- Tree Refresh Explorer
vim.keymap.set("n", "<leader>tEr", "<Cmd>NvimTreeRefresh<CR>",
    { desc = "Tree Refresh Explorer", silent = true, noremap = true })
-- Tree Resize Explorer
vim.keymap.set("n", "<leader>tEs", "<Cmd>NvimTreeResize<CR>",
    { desc = "Tree Resize Explorer", silent = true, noremap = true })
-- Float Terminal
vim.keymap.set("n", "<leader>Tf", "<Cmd>ToggleTerm direction=float<CR>",
    { desc = "Float Terminal", silent = true, noremap = true })
-- First Tab
vim.keymap.set("n", "<leader>tf", "<Cmd>tabfirst<CR>", { desc = "First Tab", silent = true, noremap = true })
-- Horizontal Terminal
vim.keymap.set("n", "<leader>Th", "<Cmd>ToggleTerm direction=horizontal<CR>",
    { desc = "Horizontal Terminal", silent = true, noremap = true })
-- ➖ Horizontal Terminal
vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>",
    { desc = "➖ Horizontal Terminal", noremap = true })
-- Last Tab
vim.keymap.set("n", "<leader>tl", "<Cmd>tablast<CR>", { desc = "Last Tab", silent = true, noremap = true })
-- New Tab
vim.keymap.set("n", "<leader>tn", "<Cmd>tabnew<CR>", { desc = "New Tab", silent = true, noremap = true })
-- Close Other Tabs
vim.keymap.set("n", "<leader>to", "<Cmd>tabonly<CR>", { desc = "Close Other Tabs", silent = true, noremap = true })
-- Tab Terminal
vim.keymap.set("n", "<leader>Tt", "<Cmd>ToggleTerm direction=tab<CR>",
    { desc = "Tab Terminal", silent = true, noremap = true })
-- Search Todos
vim.keymap.set("n", "<leader>tt", "<Cmd>TodoTelescope<CR>", { desc = "Search Todos", silent = true, noremap = true })
-- Vertical Terminal
vim.keymap.set("n", "<leader>Tv", "<Cmd>ToggleTerm direction=vertical<CR>",
    { desc = "Vertical Terminal", silent = true, noremap = true })
-- ➗ Vertical Terminal
vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>",
    { desc = "➗ Vertical Terminal", noremap = true })
-- Todos in Quickfix
vim.keymap.set("n", "<leader>tx", "<Cmd>TodoQuickFix<CR>", { desc = "Todos in Quickfix", silent = true, noremap = true })

-- ======================================================================
-- U
-- ======================================================================

-- Toggle Pin Buffer
vim.keymap.set("n", "<leader>ubB", "<Cmd>BufferLineTogglePin<CR>",
    { desc = "Toggle Pin Buffer", silent = true, noremap = true })
-- Pick Buffer
vim.keymap.set("n", "<leader>ubb", "<Cmd>BufferLinePick<CR>", { desc = "Pick Buffer", silent = true, noremap = true })
-- Hide Winbar
vim.keymap.set("n", "<leader>ubW", "<Cmd>set winbar=<CR>", { desc = "Hide Winbar", silent = true, noremap = true })
-- Show Winbar
vim.keymap.set("n", "<leader>ubw", "<Cmd>set winbar=%f<CR>", { desc = "Show Winbar", silent = true, noremap = true })
-- Toggle Cursor Column
vim.keymap.set("n", "<leader>uC", "<Cmd>set cursorcolumn!<CR>",
    { desc = "Toggle Cursor Column", silent = true, noremap = true })
-- Toggle Cursor Line
vim.keymap.set("n", "<leader>uc", "<Cmd>set cursorline!<CR>",
    { desc = "Toggle Cursor Line", silent = true, noremap = true })
-- Conceal Level 1
vim.keymap.set("n", "<leader>uc1", "<Cmd>set conceallevel=1<CR>",
    { desc = "Conceal Level 1", silent = true, noremap = true })
-- Conceal Level 2
vim.keymap.set("n", "<leader>uc2", "<Cmd>set conceallevel=2<CR>",
    { desc = "Conceal Level 2", silent = true, noremap = true })
-- Conceal Level 3
vim.keymap.set("n", "<leader>uc3", "<Cmd>set conceallevel=3<CR>",
    { desc = "Conceal Level 3", silent = true, noremap = true })
-- Hide Color Column
vim.keymap.set("n", "<leader>uCC", "<Cmd>set colorcolumn=0<CR>",
    { desc = "Hide Color Column", silent = true, noremap = true })
-- Color Column at 120
vim.keymap.set("n", "<leader>uCc", "<Cmd>set colorcolumn=120<CR>",
    { desc = "Color Column at 120", silent = true, noremap = true })
-- Color Column at 80
vim.keymap.set("n", "<leader>ucc", "<Cmd>set colorcolumn=80<CR>",
    { desc = "Color Column at 80", silent = true, noremap = true })
-- Conceal Off
vim.keymap.set("n", "<leader>uco", "<Cmd>set conceallevel=0<CR>", { desc = "Conceal Off", silent = true, noremap = true })
-- Vim Clipboard
vim.keymap.set("n", "<leader>uCP", "<Cmd>set clipboard=<CR>", { desc = "Vim Clipboard", silent = true, noremap = true })
-- System Clipboard
vim.keymap.set("n", "<leader>ucp", "<Cmd>set clipboard=unnamedplus<CR>",
    { desc = "System Clipboard", silent = true, noremap = true })
-- Open Alpha
vim.keymap.set("n", "<leader>udH", "<Cmd>Alpha<CR>", { desc = "Open Alpha", silent = true, noremap = true })
-- Open Dashboard
vim.keymap.set("n", "<leader>udh", "<Cmd>Dashboard<CR>", { desc = "Open Dashboard", silent = true, noremap = true })
-- 🌲 Toggle Explorer
vim.keymap.set("n", "<leader>ue", "<Cmd>NvimTreeToggle<CR>", { desc = "🌲 Toggle Explorer", noremap = true })
-- Show Fold Column
vim.keymap.set("n", "<leader>uFC", "<Cmd>set foldcolumn=1<CR>",
    { desc = "Show Fold Column", silent = true, noremap = true })
-- Hide Fold Column
vim.keymap.set("n", "<leader>ufc", "<Cmd>set foldcolumn=0<CR>",
    { desc = "Hide Fold Column", silent = true, noremap = true })
-- Fold by Syntax
vim.keymap.set("n", "<leader>ufD", "<Cmd>set foldmethod=syntax<CR>",
    { desc = "Fold by Syntax", silent = true, noremap = true })
-- Fold by Indent
vim.keymap.set("n", "<leader>ufd", "<Cmd>set foldmethod=indent<CR>",
    { desc = "Fold by Indent", silent = true, noremap = true })
-- Manual Folding
vim.keymap.set("n", "<leader>ufm", "<Cmd>set foldmethod=manual<CR>",
    { desc = "Manual Folding", silent = true, noremap = true })
-- Toggle Folding
vim.keymap.set("n", "<leader>ufo", "<Cmd>set foldenable!<CR>", { desc = "Toggle Folding", silent = true, noremap = true })
-- Fold by Treesitter
vim.keymap.set("n", "<leader>uft", "<Cmd>set foldmethod=expr<CR>",
    { desc = "Fold by Treesitter", silent = true, noremap = true })
-- Toggle Git Line Highlight
vim.keymap.set("n", "<leader>uG", "<Cmd>Gitsigns toggle_linehl<CR>",
    { desc = "Toggle Git Line Highlight", silent = true, noremap = true })
-- Toggle Git Signs
vim.keymap.set("n", "<leader>ug", "<Cmd>Gitsigns toggle_signs<CR>",
    { desc = "Toggle Git Signs", silent = true, noremap = true })
-- Toggle Git Blame
vim.keymap.set("n", "<leader>ugb", "<Cmd>Gitsigns toggle_current_line_blame<CR>",
    { desc = "Toggle Git Blame", silent = true, noremap = true })
-- Toggle Git Deleted
vim.keymap.set("n", "<leader>ugd", "<Cmd>Gitsigns toggle_deleted<CR>",
    { desc = "Toggle Git Deleted", silent = true, noremap = true })
-- Toggle Search Highlight
vim.keymap.set("n", "<leader>uH", "<Cmd>set hlsearch!<CR>",
    { desc = "Toggle Search Highlight", silent = true, noremap = true })
-- Clear Search Highlights
vim.keymap.set("n", "<leader>uh", "<Cmd>nohlsearch<CR>",
    { desc = "Clear Search Highlights", silent = true, noremap = true })
-- Toggle Smart Case
vim.keymap.set("n", "<leader>uI", "<Cmd>set smartcase!<CR>",
    { desc = "Toggle Smart Case", silent = true, noremap = true })
-- Toggle Ignore Case
vim.keymap.set("n", "<leader>ui", "<Cmd>set ignorecase!<CR>",
    { desc = "Toggle Ignore Case", silent = true, noremap = true })
-- Show All Whitespace
vim.keymap.set("n", "<leader>uL", "<Cmd>set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<lt>,space:␣<CR>",
    { desc = "Show All Whitespace", silent = true, noremap = true })
-- Toggle Invisible Chars
vim.keymap.set("n", "<leader>ul", "<Cmd>set list!<CR>",
    { desc = "Toggle Invisible Chars", silent = true, noremap = true })
-- Refresh Minimap
vim.keymap.set("n", "<leader>uM", "<Cmd>MinimapRefresh<CR>", { desc = "Refresh Minimap", silent = true, noremap = true })
-- Toggle Minimap
vim.keymap.set("n", "<leader>um", "<Cmd>MinimapToggle<CR>", { desc = "Toggle Minimap", silent = true, noremap = true })
-- Disable Mouse
vim.keymap.set("n", "<leader>umS", "<Cmd>set mouse=<CR>", { desc = "Disable Mouse", silent = true, noremap = true })
-- Enable Mouse
vim.keymap.set("n", "<leader>ums", "<Cmd>set mouse=a<CR>", { desc = "Enable Mouse", silent = true, noremap = true })
-- Toggle All Numbers
vim.keymap.set("n", "<leader>uN", "<Cmd>set number! relativenumber!<CR>",
    { desc = "Toggle All Numbers", silent = true, noremap = true })
-- Toggle Line Numbers
vim.keymap.set("n", "<leader>un", "<Cmd>set number!<CR>", { desc = "Toggle Line Numbers", silent = true, noremap = true })
-- Dismiss Notifications
vim.keymap.set("n", "<leader>unH", "<Cmd>lua require('notify').dismiss()<CR>",
    { desc = "Dismiss Notifications", silent = true, noremap = true })
-- Show Notifications
vim.keymap.set("n", "<leader>unh", "<Cmd>Notifications<CR>",
    { desc = "Show Notifications", silent = true, noremap = true })
-- Toggle Aerial Outline
vim.keymap.set("n", "<leader>uO", "<Cmd>AerialToggle<CR>",
    { desc = "Toggle Aerial Outline", silent = true, noremap = true })
-- Toggle Symbols Outline
vim.keymap.set("n", "<leader>uo", "<Cmd>SymbolsOutline<CR>",
    { desc = "Toggle Symbols Outline", silent = true, noremap = true })
-- Coding Mode
vim.keymap.set("n", "<leader>up1", "<Cmd>set number relativenumber cursorline signcolumn=yes<CR>",
    { desc = "Coding Mode", silent = true, noremap = true })
-- Minimal Mode
vim.keymap.set("n", "<leader>up2", "<Cmd>set nonumber norelativenumber nocursorline signcolumn=no<CR>",
    { desc = "Minimal Mode", silent = true, noremap = true })
-- Focus Mode
vim.keymap.set("n", "<leader>up3", "<Cmd>ZenMode<CR><Cmd>Twilight<CR>",
    { desc = "Focus Mode", silent = true, noremap = true })
-- Toggle Relative Numbers
vim.keymap.set("n", "<leader>ur", "<Cmd>set relativenumber!<CR>",
    { desc = "Toggle Relative Numbers", silent = true, noremap = true })
-- Toggle Ruler
vim.keymap.set("n", "<leader>urr", "<Cmd>set ruler!<CR>", { desc = "Toggle Ruler", silent = true, noremap = true })
-- Set Spell Language (EN)
vim.keymap.set("n", "<leader>uS", "<Cmd>set spelllang=en_us<CR>",
    { desc = "Set Spell Language (EN)", silent = true, noremap = true })
-- Toggle Spell Check
vim.keymap.set("n", "<leader>us", "<Cmd>set spell!<CR>", { desc = "Toggle Spell Check", silent = true, noremap = true })
-- No Scrolloff
vim.keymap.set("n", "<leader>us0", "<Cmd>set scrolloff=0<CR>", { desc = "No Scrolloff", silent = true, noremap = true })
-- English (GB)
vim.keymap.set("n", "<leader>usb", "<Cmd>set spelllang=en_gb<CR>",
    { desc = "English (GB)", silent = true, noremap = true })
-- Toggle Show Command
vim.keymap.set("n", "<leader>usc", "<Cmd>set showcmd!<CR>",
    { desc = "Toggle Show Command", silent = true, noremap = true })
-- German
vim.keymap.set("n", "<leader>usd", "<Cmd>set spelllang=de<CR>", { desc = "German", silent = true, noremap = true })
-- English (US)
vim.keymap.set("n", "<leader>use", "<Cmd>set spelllang=en_us<CR>",
    { desc = "English (US)", silent = true, noremap = true })
-- French
vim.keymap.set("n", "<leader>usf", "<Cmd>set spelllang=fr<CR>", { desc = "French", silent = true, noremap = true })
-- Toggle Treesitter Highlight
vim.keymap.set("n", "<leader>ush", "<Cmd>TSToggle highlight<CR>",
    { desc = "Toggle Treesitter Highlight", silent = true, noremap = true })
-- Toggle Show Mode
vim.keymap.set("n", "<leader>usm", "<Cmd>set showmode!<CR>", { desc = "Toggle Show Mode", silent = true, noremap = true })
-- Center Cursor
vim.keymap.set("n", "<leader>usO", "<Cmd>set scrolloff=999<CR>",
    { desc = "Center Cursor", silent = true, noremap = true })
-- Scrolloff 8
vim.keymap.set("n", "<leader>uso", "<Cmd>set scrolloff=8<CR>", { desc = "Scrolloff 8", silent = true, noremap = true })
-- Spanish
vim.keymap.set("n", "<leader>uss", "<Cmd>set spelllang=es<CR>", { desc = "Spanish", silent = true, noremap = true })
-- Show Statusline
vim.keymap.set("n", "<leader>usT", "<Cmd>set laststatus=3<CR>",
    { desc = "Show Statusline", silent = true, noremap = true })
-- Hide Statusline
vim.keymap.set("n", "<leader>ust", "<Cmd>set laststatus=0<CR>",
    { desc = "Hide Statusline", silent = true, noremap = true })
-- Disable Syntax
vim.keymap.set("n", "<leader>usY", "<Cmd>syntax off<CR>", { desc = "Disable Syntax", silent = true, noremap = true })
-- Enable Syntax
vim.keymap.set("n", "<leader>usy", "<Cmd>syntax on<CR>", { desc = "Enable Syntax", silent = true, noremap = true })
-- Toggle Terminal
vim.keymap.set("n", "<leader>uT", "<Cmd>ToggleTerm<CR>", { desc = "Toggle Terminal", silent = true, noremap = true })
-- Twilight
vim.keymap.set("n", "<leader>ut", "<Cmd>Twilight<CR>", { desc = "Twilight", silent = true, noremap = true })
-- Light Background
vim.keymap.set("n", "<leader>utB", "<Cmd>set background=light<CR>",
    { desc = "Light Background", silent = true, noremap = true })
-- Dark Background
vim.keymap.set("n", "<leader>utb", "<Cmd>set background=dark<CR>",
    { desc = "Dark Background", silent = true, noremap = true })
-- Float Terminal
vim.keymap.set("n", "<leader>uTf", "<Cmd>ToggleTerm direction=float<CR>",
    { desc = "Float Terminal", silent = true, noremap = true })
-- Gruvbox
vim.keymap.set("n", "<leader>utg", "<Cmd>set background=dark<CR><Cmd>colorscheme gruvbox<CR>",
    { desc = "Gruvbox", silent = true, noremap = true })
-- Horizontal Terminal
vim.keymap.set("n", "<leader>uTh", "<Cmd>ToggleTerm direction=horizontal<CR>",
    { desc = "Horizontal Terminal", silent = true, noremap = true })
-- Change Theme
vim.keymap.set("n", "<leader>uth", "<Cmd>Telescope colorscheme<CR>",
    { desc = "Change Theme", silent = true, noremap = true })
-- Toggle Transparency
vim.keymap.set("n", "<leader>utr", "<Cmd>lua require('transparent').toggle()<CR>",
    { desc = "Toggle Transparency", silent = true, noremap = true })
-- Tokyo Night
vim.keymap.set("n", "<leader>utt", "<Cmd>set background=dark<CR><Cmd>colorscheme tokyonight<CR>",
    { desc = "Tokyo Night", silent = true, noremap = true })
-- Vertical Terminal
vim.keymap.set("n", "<leader>uTv", "<Cmd>ToggleTerm direction=vertical<CR>",
    { desc = "Vertical Terminal", silent = true, noremap = true })
-- Virtual Edit Off
vim.keymap.set("n", "<leader>uV", "<Cmd>set virtualedit=<CR>",
    { desc = "Virtual Edit Off", silent = true, noremap = true })
-- Virtual Edit All
vim.keymap.set("n", "<leader>uv", "<Cmd>set virtualedit=all<CR>",
    { desc = "Virtual Edit All", silent = true, noremap = true })
-- Toggle Line Break
vim.keymap.set("n", "<leader>uW", "<Cmd>set linebreak!<CR>",
    { desc = "Toggle Line Break", silent = true, noremap = true })
-- Toggle Line Wrap
vim.keymap.set("n", "<leader>uw", "<Cmd>set wrap!<CR>", { desc = "Toggle Line Wrap", silent = true, noremap = true })
-- Toggle Window Numbers
vim.keymap.set("n", "<leader>uwn", "<Cmd>set number! relativenumber!<CR>",
    { desc = "Toggle Window Numbers", silent = true, noremap = true })
-- Toggle Sign Column
vim.keymap.set("n", "<leader>uws", "<Cmd>set signcolumn=auto<CR>",
    { desc = "Toggle Sign Column", silent = true, noremap = true })
-- Toggle Crosshair
vim.keymap.set("n", "<leader>ux", "<Cmd>set cursorline! cursorcolumn!<CR>",
    { desc = "Toggle Crosshair", silent = true, noremap = true })
-- Zen + Twilight
v im.keymap.set("n", "<leader>uZ", "<Cmd>ZenMode<CR><Cmd>Twilight<CR>",

    { desc = "Zen + Twilight", silent = true, noremap = true })
-- Zen Mode
vim.keymap.set("n", "<leader>uz", "<Cmd>ZenMode<CR>", { desc = "Zen Mode", silent = true, noremap = true })

-- ======================================================================
-- V
-- ======================================================================

-- Equal Size
vim.keymap.set("n", "<leader>v=", "<C-W>=", { desc = "Equal Size", silent = true, noremap = true })
-- Maximize Height
vim.keymap.set("n", "<leader>v_", "<C-W>_", { desc = "Maximize Height", silent = true, noremap = true })
-- Close Window
vim.keymap.set("n", "<leader>vc", "<Cmd>close<CR>", { desc = "Close Window", silent = true, noremap = true })
-- Go Left
vim.keymap.set("n", "<leader>vh", "<C-W>h", { desc = "Go Left", silent = true, noremap = true })
-- Go Down
vim.keymap.set("n", "<leader>vj", "<C-W>j", { desc = "Go Down", silent = true, noremap = true })
-- Go Up
vim.keymap.set("n", "<leader>vk", "<C-W>k", { desc = "Go Up", silent = true, noremap = true })
-- Go Right
vim.keymap.set("n", "<leader>vl", "<C-W>l", { desc = "Go Right", silent = true, noremap = true })
-- Close Other Windows
vim.keymap.set("n", "<leader>vo", "<Cmd>only<CR>", { desc = "Close Other Windows", silent = true, noremap = true })
-- Horizontal Split
vim.keymap.set("n", "<leader>vs", "<Cmd>split<CR>", { desc = "Horizontal Split", silent = true, noremap = true })
-- Vertical Split
vim.keymap.set("n", "<leader>vv", "<Cmd>vsplit<CR>", { desc = "Vertical Split", silent = true, noremap = true })
-- Maximize Width
vim.keymap.set("n", "<leader>v|", "<C-W>|", { desc = "Maximize Width", silent = true, noremap = true })

-- ======================================================================
-- W
-- ======================================================================

-- 💾 Save
vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "💾 Save", noremap = true })
-- Quick Save
vim.keymap.set("n", "<leader>w<CR>", "<Cmd>w<CR>", { desc = "Quick Save", silent = true, noremap = true })
-- Quick Quit
vim.keymap.set("n", "<leader>w<Esc>", "<Cmd>q<CR>", { desc = "Quick Quit", silent = true, noremap = true })
-- Toggle Auto-write All
vim.keymap.set("n", "<leader>wA", "<Cmd>set autowriteall!<CR>",
    { desc = "Toggle Auto-write All", silent = true, noremap = true })
-- Toggle Auto-write
vim.keymap.set("n", "<leader>wa", "<Cmd>set autowrite!<CR>",
    { desc = "Toggle Auto-write", silent = true, noremap = true })
-- Toggle Write Backup
vim.keymap.set("n", "<leader>wB", "<Cmd>set writebackup!<CR>",
    { desc = "Toggle Write Backup", silent = true, noremap = true })
-- Toggle Backup
vim.keymap.set("n", "<leader>wb", "<Cmd>set backup!<CR>", { desc = "Toggle Backup", silent = true, noremap = true })
-- Close All Buffers But Current
vim.keymap.set("n", "<leader>wba", "<Cmd>%bd|e#|bd#<CR>",
    { desc = "Close All Buffers But Current", silent = true, noremap = true })
-- Close Buffers to Left
vim.keymap.set("n", "<leader>wbh", "<Cmd>BufferLineCloseLeft<CR>",
    { desc = "Close Buffers to Left", silent = true, noremap = true })
-- Close Buffers to Right
vim.keymap.set("n", "<leader>wbl", "<Cmd>BufferLineCloseRight<CR>",
    { desc = "Close Buffers to Right", silent = true, noremap = true })
-- Close Other Buffers
vim.keymap.set("n", "<leader>wbo", "<Cmd>%bd|e#<CR>", { desc = "Close Other Buffers", silent = true, noremap = true })
-- Force Close Window
vim.keymap.set("n", "<leader>wC", "<Cmd>close!<CR>", { desc = "Force Close Window", silent = true, noremap = true })
-- Close Window
vim.keymap.set("n", "<leader>wc", "<Cmd>close<CR>", { desc = "Close Window", silent = true, noremap = true })
-- Force Delete Buffer
vim.keymap.set("n", "<leader>wD", "<Cmd>bd!<CR>", { desc = "Force Delete Buffer", silent = true, noremap = true })
-- Delete Buffer
vim.keymap.set("n", "<leader>wd", "<Cmd>bd<CR>", { desc = "Delete Buffer", silent = true, noremap = true })
-- Show Encoding
vim.keymap.set("n", "<leader>wE", "<Cmd>set fileencoding?<CR>", { desc = "Show Encoding", silent = true, noremap = true })
-- Set UTF-8 Encoding
vim.keymap.set("n", "<leader>we", "<Cmd>set fileencoding=utf-8<CR>",
    { desc = "Set UTF-8 Encoding", silent = true, noremap = true })
-- Force Save All
vim.keymap.set("n", "<leader>wF", "<Cmd>wa!<CR>", { desc = "Force Save All", silent = true, noremap = true })
-- Force Save
vim.keymap.set("n", "<leader>wf", "<Cmd>w!<CR>", { desc = "Force Save", silent = true, noremap = true })
-- File History
vim.keymap.set("n", "<leader>wh", "<Cmd>browse oldfiles<CR>", { desc = "File History", silent = true, noremap = true })
-- File Info
vim.keymap.set("n", "<leader>wi", "<Cmd>file<CR>", { desc = "File Info", silent = true, noremap = true })
-- Toggle Undo File
vim.keymap.set("n", "<leader>wJ", "<Cmd>set undofile!<CR>", { desc = "Toggle Undo File", silent = true, noremap = true })
-- Toggle Swap File
vim.keymap.set("n", "<leader>wj", "<Cmd>set swapfile!<CR>", { desc = "Toggle Swap File", silent = true, noremap = true })
-- Delete File (Shell)
vim.keymap.set("n", "<leader>wk", "<Cmd>!rm %<CR>", { desc = "Delete File (Shell)", silent = true, noremap = true })
-- Show Line Endings
vim.keymap.set("n", "<leader>wL", "<Cmd>set fileformat?<CR>",
    { desc = "Show Line Endings", silent = true, noremap = true })
-- Unix Line Endings
vim.keymap.set("n", "<leader>wl", "<Cmd>set fileformat=unix<CR>",
    { desc = "Unix Line Endings", silent = true, noremap = true })
-- Move File
vim.keymap.set("n", "<leader>wM", "<Cmd>Move ", { desc = "Move File", silent = true, noremap = true })
-- Rename File
vim.keymap.set("n", "<leader>wm", "<Cmd>Rename ", { desc = "Rename File", silent = true, noremap = true })
-- New File (Tab)
vim.keymap.set("n", "<leader>wN", "<Cmd>tabnew<CR>", { desc = "New File (Tab)", silent = true, noremap = true })
-- New File
vim.keymap.set("n", "<leader>wn", "<Cmd>enew<CR>", { desc = "New File", silent = true, noremap = true })
-- Force Close Others
vim.keymap.set("n", "<leader>wO", "<Cmd>only!<CR>", { desc = "Force Close Others", silent = true, noremap = true })
-- Close Other Windows
vim.keymap.set("n", "<leader>wo", "<Cmd>only<CR>", { desc = "Close Other Windows", silent = true, noremap = true })
-- Copy Full Path
vim.keymap.set("n", "<leader>wP", "<Cmd>let @+ = expand('%:p')<CR>",
    { desc = "Copy Full Path", silent = true, noremap = true })
-- Show Full Path
vim.keymap.set("n", "<leader>wp", "<Cmd>echo expand('%:p')<CR>",
    { desc = "Show Full Path", silent = true, noremap = true })
-- Save All & Quit
vim.keymap.set("n", "<leader>wQ", "<Cmd>wqa<CR>", { desc = "Save All & Quit", silent = true, noremap = true })
-- Save & Quit
vim.keymap.set("n", "<leader>wq", "<Cmd>wq<CR>", { desc = "Save & Quit", silent = true, noremap = true })
-- Copy Filename
vim.keymap.set("n", "<leader>wR", "<Cmd>let @+ = expand('%:t')<CR>",
    { desc = "Copy Filename", silent = true, noremap = true })
-- Copy Relative Path
vim.keymap.set("n", "<leader>wr", "<Cmd>let @+ = expand('%')<CR>",
    { desc = "Copy Relative Path", silent = true, noremap = true })
-- Save All
vim.keymap.set("n", "<leader>wS", "<Cmd>wa<CR>", { desc = "Save All", silent = true, noremap = true })
-- Save
vim.keymap.set("n", "<leader>ws", "<Cmd>w<CR>", { desc = "Save", silent = true, noremap = true })
-- Delete Session
vim.keymap.set("n", "<leader>wsd", "<Cmd>!rm Session.vim<CR>", { desc = "Delete Session", silent = true, noremap = true })
-- Load Session
vim.keymap.set("n", "<leader>wsl", "<Cmd>source Session.vim<CR>",
    { desc = "Load Session", silent = true, noremap = true })
-- Save Session
vim.keymap.set("n", "<leader>wss", "<Cmd>mksession! Session.vim<CR>",
    { desc = "Save Session", silent = true, noremap = true })
-- Toggle Modifiable
vim.keymap.set("n", "<leader>wT", "<Cmd>set modifiable!<CR>",
    { desc = "Toggle Modifiable", silent = true, noremap = true })
-- Toggle Read-only
vim.keymap.set("n", "<leader>wt", "<Cmd>set readonly!<CR>", { desc = "Toggle Read-only", silent = true, noremap = true })
-- Redo File Change
vim.keymap.set("n", "<leader>wU", "<Cmd>later 1f<CR>", { desc = "Redo File Change", silent = true, noremap = true })
-- Undo File Change
vim.keymap.set("n", "<leader>wu", "<Cmd>earlier 1f<CR>", { desc = "Undo File Change", silent = true, noremap = true })
-- Save As
vim.keymap.set("n", "<leader>wv", "<Cmd>saveas ", { desc = "Save As", silent = true, noremap = true })
-- Save All Files
vim.keymap.set("n", "<leader>wW", "<Cmd>wa<CR>", { desc = "Save All Files", silent = true, noremap = true })
-- 💾 Save File
vim.keymap.set("n", "<leader>ww", "<Cmd>w<CR>", { desc = "💾 Save File", silent = true, noremap = true })
-- Save All & Close
vim.keymap.set("n", "<leader>wX", "<Cmd>xa<CR>", { desc = "Save All & Close", silent = true, noremap = true })
-- Make Executable
vim.keymap.set("n", "<leader>wx", "<Cmd>!chmod +x %<CR>", { desc = "Make Executable", silent = true, noremap = true })
-- Save with Sudo
vim.keymap.set("n", "<leader>wz", "<Cmd>w !sudo tee % > /dev/null<CR>",
    { desc = "Save with Sudo", silent = true, noremap = true })

