-- =================================
-- Buffer Leaders (B)
-- =================================


-- Delete All Others
vim.keymap.set("n", "<leader>ba", "<Cmd>%bd|e#<CR>", { desc = "❌ Delete All Others", noremap = true })

-- Delete Current active buffer!
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "❌ Delete Buffer", noremap = true })

vim.keymap.set("n", "<leader>bl", "<Cmd>blast<CR>", { desc = "Last Buffer", silent = true, noremap = true })

vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next Buffer", silent = true,        noremap = true })

vim.keymap.set("n", "<leader>bs", "<Cmd>w<CR>", { desc = "Save Bu       ffer", silent = true, noremap = true })

vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc =        "Previous Buffer", silent = true, noremap = true })

vim.keymap.set("n", "<leader>bw", "<Cmd>bwipeout<CR>", { desc = "       Wipeout Buffer", silent = true, noremap = true })


-- =================================
-- Buffer Leader (C)
-- =================================


vim.keymap.set("n", "<leader>cf", "<Cmd>Telescope find_files cwd=~/.co       nfig/nvim<CR>", { desc = "Find Config Files", silent = true, noremap =        true })

vim.keymap.set("n", "<leader>cg", "<Cmd>Telescope live_grep cwd=~       /.config/nvim<CR>", { desc = "Grep Config Files", silent = true,        noremap = true })

vim.keymap.set("n", "<leader>cK", "<Cmd>Telescope keymaps<CR>", { d     esc = "Search Keymaps", silent = true, noremap = true })

vim.keymap.set("n", "<leader>cN", "<Cmd>Telescope notify<CR>", { de     sc = "Search Notifications", silent = true, noremap = true })       116 -- Show Notifications

vim.keymap.set("n", "<leader>cP", "<Cmd>Lazy profile<CR>", { desc = "Profile Plugins", silent = true, noremap = true })                         -- Plugin Manager 

vim.keymap.set("n", "<leader>cp", "<Cmd>Lazy<CR>", { desc = "Plugin Manager", silent = true, noremap = true })

vim.keymap.set("n", "<leader>cR", "<Cmd>LspRestart<CR>", { desc = "Restart LSP", silent = true, noremap = true })                               -- Reload Config

vim.keymap.set("n", "<leader>cr", "<Cmd>source $MYVIMRC<CR>", { desc = "Reload Config", silent = true, noremap = true })

vim.keymap.set("n", "<leader>cU", "<Cmd>Lazy update --wait<CR>", { desc = "Update Plugins (Wait)", silent = true, noremap = true })

vim.keymap.set("n", "<leader>cw", "<Cmd>pwd<CR>", { desc = "Show Working Directory", silent = true, noremap = true })

-- =================================
-- Buffer Leader (D)
-- =================================
-- Skip 



-- =================================
-- Buffer Leader (e)
-- =================================
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer", noremap = true })


-- =================================
-- Buffer Leader (F)
-- =================================
vim.keymap.set("n", "<leader>ft", "<Cmd>Telescope colorscheme<CR>", { desc = "Themes", silent =   true, noremap = true })

  -- Fuzzy Find in Buffer         

vim.keymap.set("n", "<leader>f*", "<Cmd>Telescope current_buffer_fuzzy_find<CR>",    { desc = "Fuzzy Find in Buffer", silent = true, noremap = true })
  -- Find Config Files             
vim.keymap.set("n", "<leader>f.", "<Cmd>Telescope find_files cwd=~/.config/nvim<CR>",   { desc = "Find Config Files", silent = true, noremap = true })                                                                                        -- Search History                                                                                                                      
vim.keymap.set("n", "<leader>f/", "<Cmd>Telescope search_history<CR>",      { desc = "Search History", silent = true, noremap = true })                                                                                           -- Command History   

vim.keymap.set("n", "<leader>f:", "<Cmd>Telescope command_history<CR>",   { desc = "Command History", silent = true, noremap = true })
  vim.keymap.set("n", "<leader>f_", "", { silent = true, noremap = true })
  -- Autocommands                                                                                                                                          
vim.keymap.set("n", "<leader>fa", "<Cmd>Telescope autocommands<CR>",
      { desc = "Autocommands", silent = true, noremap = true })             -- All Buffers
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
󰌶
✘     { desc = "File Browser (cwd)", silent = true, noremap = true })
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

  vim.keymap.set("n", "<leader>fk", "<Cmd>Telescope keymaps<CR>", { desc = "Keymaps", silent = true, noremap = true })    -- Location List

vim.keymap.set("n", "<leader>fn", "<Cmd>enew<CR>", { desc = "New File", silent = true, nore       map = true })

  -- Snipe: Open buffer menu
  vim.keymap.set("n", "<leader>gB", "", { desc = "Snipe: Open buffer menu", silent = true, noremap = true })

  vim.keymap.set("n", "<leader>gD", "", { desc = "Snipe: Open buffer menu to delete", silent = true, noremap = true })

-- =================================
-- Buffer Leader (L)
-- =================================

vim.keymap.set("n", "<leader>lTT", "<Cmd>Trouble diagnostics toggle<CR>",                                                   { desc = "Toggle Trouble", silent = true, noremap = true })


-- =================================
-- Buffer Leader (M)
-- =================================

  vim.keymap.set("v", "<leader>m", ":MoveBlock<CR>", { desc = "Move block to line", noremap = true })                     -- Move block to line
  vim.keymap.set("s", "<leader>m", ":MoveBlock<CR>", { desc = "Move block to line", noremap = true })                     -- Move block to line
  vim.keymap.set("x", "<leader>m", ":MoveBlock<CR>", { desc = "Move block to line", noremap = true })                     -- CD to File Dir
  vim.keymap.set("n", "<leader>mh", "<Cmd>Telescope notify<CR>",
      { desc = "Notification History", silent = true, noremap = true })                                                   -- Lazy Plugin Manager

  vim.keymap.set("n", "<leader>mm", "<Cmd>messages<CR>", { desc = "Show Messages", silent = true, noremap = true })
  -- New File        

vim.keymap.set("n", "<leader>mn", "<Cmd>enew<CR>", { desc = "New File", silent = true, noremap = true })

  -- -- Paste Before from Clipboard
vim.keymap.set("n", "<leader>mP", "\"+P", { desc = "Paste Before from Clipboard", silent = true, noremap = true })      -- Paste from Clipboard
  vim.keymap.set("n", "<leader>mp", "\"+p", { desc = "Paste from Clipboard", silent = true, noremap = true })

  -- Yank All   

  vim.keymap.set("n", "<leader>my", "<Cmd>%y+<CR>", { desc = "Yank All", silent = true, noremap = true })


-- =================================
-- Buffer Leader (n)
-- =================================
  -- Noice: Show errors
  vim.keymap.set("n", "<leader>ne", "<Cmd>Noice errors<CR>", { desc = "Noice: Show errors", silent = true, n  oremap = true })


-- =================================
-- Buffer Leader (q)
-- =================================
  -- ❌ Quit
  vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "❌ Quit", noremap = true })                                    -- ❌ Quit All
  vim.keymap.set("n", "<leader>qa", "<Cmd>qa<CR>", { desc = "❌ Quit All", noremap = true })
  -- Force Quit All
  vim.keymap.set("n", "<leader>qF", "<Cmd>qa!<CR>", { desc = "Force Quit All", silent = true, noremap = true })           -- Force Quit
  vim.keymap.set("n", "<leader>qf", "<Cmd>q!<CR>", { desc = "Force Quit", silent = true, noremap = true })
  -- Quit All
  vim.keymap.set("n", "<leader>qQ", "<Cmd>qa<CR>", { desc = "Quit All", silent = true, noremap = true })
  -- Quit
  vim.keymap.set("n", "<leader>qq", "<Cmd>q<CR>", { desc = "Quit", silent = true, noremap = true })
  -- Save All & Quit
  vim.keymap.set("n", "<leader>qW", "<Cmd>wqa<CR>", { desc = "Save All & Quit", silent = true, noremap = true })          -- Save & Quit
  vim.keymap.set("n", "<leader>qw", "<Cmd>wq<CR>", { desc = "Save & Quit", silent = true, noremap = true })       

-- =================================
-- Buffer Leader (R)
-- =================================
-- Replace in whole file
vim.keymap.set("n", "<leader>ra", ":lua SubstituteAll()<CR>", { desc = "Replace in whole file", noremap = true })                                                                                   -- Refresh File Explorer
vim.keymap.set("n", "<leader>re", ":NvimTreeRefresh<CR>", { desc = "Refresh File Explorer", noremap = true })
-- Replace in matching lines

vim.keymap.set("n", "<leader>rm", ":lua SubstituteMatchingLines()<CR>",  { desc = "Replace in matching lines", noremap = true }) 

vim.keymap.set("n", "<leader>rn", "", { silent = true, noremap = true })
-- Replace in selection

vim.keymap.set("x", "<leader>rs", ":s///g<Left><Left>", { desc = "Replace in selection", noremap =
 true })                                                                                          -- Replace in selection
 vim.keymap.set("v", "<leader>rs", ":s///g<Left><Left>", { desc = "Replace in selection", noremap = true })                                                                                          -- Range substitute

 vim.keymap.set("n", "<leader>rs", ":lua SubstituteRange()<CR>", { desc = "Range substitute", noremap = true })

 -- Replace in selection

vim.keymap.set("s", "<leader>rs", ":s///g<Left><Left>", { desc = "Replace in selection", noremap = true })
-- =================================
-- Buffer Leader (S)
-- =================================

vim.keymap.set("n", "<leader>sb", "", { desc = "Snacks: Buffer picker", silent = true, noremap = true })

vim.keymap.set("n", "<leader>sn", "", { desc = "Snacks: Show notification history", silent = true, noremap = true })

-- =================================
-- Buffer Leader (U)
-- =================================
vim.keymap.set("n", "<leader>un", "<Cmd>set number!<CR>", { desc = "Toggle Line Numbers", silent = true, noremap = true })
