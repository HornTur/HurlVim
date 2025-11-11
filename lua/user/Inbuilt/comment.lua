-- Smart comment toggler for Neovim
-- Add this to your init.lua or a separate lua file

local M = {}

-- Comment patterns for different languages
local comment_patterns = {
  -- Single line comments
  lua = "-- %s",
  python = "# %s",
  ruby = "# %s",
  perl = "# %s",
  sh = "# %s",
  bash = "# %s",
  zsh = "# %s",
  fish = "# %s",
  r = "# %s",
  yaml = "# %s",
  toml = "# %s",
  conf = "# %s",
  gitconfig = "# %s",
  
  -- C-style comments
  c = "// %s",
  cpp = "// %s",
  java = "// %s",
  javascript = "// %s",
  typescript = "// %s",
  javascriptreact = "// %s",
  typescriptreact = "// %s",
  go = "// %s",
  rust = "// %s",
  php = "// %s",
  swift = "// %s",
  kotlin = "// %s",
  scala = "// %s",
  dart = "// %s",
  cs = "// %s",
  
  -- Lisp-style
  lisp = "; %s",
  scheme = "; %s",
  clojure = "; %s",
  
  -- Other
  vim = '" %s',
  vimrc = '" %s',
  sql = "-- %s",
  haskell = "-- %s",
  elm = "-- %s",
  ocaml = "(* %s *)",
  html = "<!-- %s -->",
  xml = "<!-- %s -->",
  markdown = "<!-- %s -->",
  tex = "%% %s",
  matlab = "%% %s",
  erlang = "%% %s",
}

-- Get comment pattern for current filetype
function M.get_comment_pattern()
  local ft = vim.bo.filetype
  return comment_patterns[ft] or "# %s"  -- default to # if unknown
end

-- Check if a line is commented
function M.is_commented(line, pattern)
  local comment_str = pattern:match("^(.-)%%s"):gsub("%s+$", "")
  local escaped_pattern = vim.pesc(comment_str)
  return line:match("^%s*" .. escaped_pattern) ~= nil
end

-- Toggle comment on a single line
function M.toggle_line_comment(line_num)
  local line = vim.fn.getline(line_num)
  local pattern = M.get_comment_pattern()
  local comment_str = pattern:match("^(.-)%%s"):gsub("%s+$", "")
  
  if M.is_commented(line, pattern) then
    -- Uncomment: remove comment string
    local escaped_pattern = vim.pesc(comment_str)
    local new_line = line:gsub("^(%s*)" .. escaped_pattern .. "%s?", "%1")
    vim.fn.setline(line_num, new_line)
  else
    -- Comment: add comment string
    local indent = line:match("^%s*")
    local content = line:sub(#indent + 1)
    local new_line = indent .. comment_str .. " " .. content
    vim.fn.setline(line_num, new_line)
  end
end

-- Toggle comment on visual selection
function M.toggle_comment()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local pattern = M.get_comment_pattern()
  
  -- Check if all lines are commented
  local all_commented = true
  for line_num = start_line, end_line do
    local line = vim.fn.getline(line_num)
    if line:match("%S") and not M.is_commented(line, pattern) then
      all_commented = false
      break
    end
  end
  
  -- Toggle all lines based on whether all are commented
  local comment_str = pattern:match("^(.-)%%s"):gsub("%s+$", "")
  local escaped_pattern = vim.pesc(comment_str)
  
  for line_num = start_line, end_line do
    local line = vim.fn.getline(line_num)
    if line:match("%S") then  -- Skip empty lines
      if all_commented then
        -- Uncomment
        local new_line = line:gsub("^(%s*)" .. escaped_pattern .. "%s?", "%1")
        vim.fn.setline(line_num, new_line)
      else
        -- Comment
        local indent = line:match("^%s*")
        local content = line:sub(#indent + 1)
        local new_line = indent .. comment_str .. " " .. content
        vim.fn.setline(line_num, new_line)
      end
    end
  end
end

-- Setup function to create keymaps
function M.setup(opts)
  opts = opts or {}
  local keymap = opts.keymap or "<C-_>"  -- Ctrl+/ (terminal sends Ctrl+_)
  local leader_map = "<leader>gc"       -- New keymap

  -- Function to toggle visual selection
  local visual_toggle = function()
    M.toggle_comment()
    vim.cmd('normal! gv')
  end

  -- Function to toggle current line
  local normal_toggle = function()
    M.toggle_line_comment(vim.fn.line('.'))
  end

  -- Visual mode mappings
  vim.keymap.set('v', keymap, visual_toggle, { noremap = true, silent = true, desc = "Toggle comment" })
  vim.keymap.set('v', leader_map, visual_toggle, { noremap = true, silent = true, desc = "Toggle comment" })

  -- Normal mode mappings
  vim.keymap.set('n', keymap, normal_toggle, { noremap = true, silent = true, desc = "Toggle comment" })
  vim.keymap.set('n', leader_map, normal_toggle, { noremap = true, silent = true, desc = "Toggle comment" })
end

-- Auto-setup with default keymap
M.setup()

return M
