-- Neovim Mapping Collector for jnv config
-- Location: ~/.config/jnv/lua/user/collect-mappings.lua
-- Usage: :lua require('user.collect-mappings').collect_all()

local M = {}

-- Get all keymaps for a specific mode
local function get_keymaps(mode)
  local keymaps = vim.api.nvim_get_keymap(mode)
  local buf_keymaps = vim.api.nvim_buf_get_keymap(0, mode)
  
  for _, keymap in ipairs(buf_keymaps) do
    table.insert(keymaps, keymap)
  end
  
  return keymaps
end

-- Extract leader mappings and sort them
local function extract_leader_mappings()
  local leader = vim.g.mapleader or '\\'
  local leader_maps = {}
  local modes = {'n', 'v', 'x', 'i', 'o', 's', 't', 'c'}
  
  for _, mode in ipairs(modes) do
    local keymaps = get_keymaps(mode)
    
    for _, keymap in ipairs(keymaps) do
      local lhs = keymap.lhs or ''
      
      -- Check if it starts with leader
      if lhs:match('^<[Ll]eader>') or lhs:match('^' .. vim.pesc(leader)) then
        local key = lhs:gsub('^<[Ll]eader>', ''):gsub('^' .. vim.pesc(leader), '')
        
        table.insert(leader_maps, {
          mode = mode,
          key = key,
          lhs = lhs,
          rhs = keymap.rhs or '',
          desc = keymap.desc or '',
          silent = keymap.silent == 1,
          noremap = keymap.noremap == 1,
          expr = keymap.expr == 1,
        })
      end
    end
  end
  
  -- Sort: case-insensitive, but uppercase before lowercase for same letter
  table.sort(leader_maps, function(a, b)
    local a_lower = a.key:lower()
    local b_lower = b.key:lower()
    
    if a_lower == b_lower then
      return a.key < b.key
    end
    return a_lower < b_lower
  end)
  
  return leader_maps
end

-- Extract command mappings
local function extract_command_mappings()
  local commands = vim.api.nvim_get_commands({})
  local command_list = {}
  
  for name, details in pairs(commands) do
    table.insert(command_list, {
      name = name,
      definition = details.definition or '',
      bang = details.bang,
      bar = details.bar,
      range = details.range,
      nargs = details.nargs,
      complete = details.complete,
    })
  end
  
  -- Sort alphabetically
  table.sort(command_list, function(a, b)
    return a.name < b.name
  end)
  
  return command_list
end

-- Format leader mappings for output
local function format_leader_mappings(maps)
  local lines = {
    '-- =================================================================',
    '-- LEADER MAPPINGS (Sorted A-Z)',
    '-- =================================================================',
    '-- Generated: ' .. os.date('%Y-%m-%d %H:%M:%S'),
    '-- Leader key: ' .. (vim.g.mapleader or '\\'),
    '-- Total mappings: ' .. #maps,
    '-- =================================================================',
    '',
  }
  
  local current_letter = ''
  
  for _, map in ipairs(maps) do
    local first_char = map.key:sub(1, 1)
    local first_upper = first_char:upper()
    
    -- Add section headers for each letter
    if first_upper ~= current_letter and first_upper:match('[A-Z]') then
      current_letter = first_upper
      table.insert(lines, '')
      table.insert(lines, '-- ' .. string.rep('=', 70))
      table.insert(lines, '-- ' .. current_letter)
      table.insert(lines, '-- ' .. string.rep('=', 70))
      table.insert(lines, '')
    end
    
    -- Build options
    local opts = {}
    if map.desc and map.desc ~= '' then
      table.insert(opts, 'desc = "' .. map.desc:gsub('"', '\\"') .. '"')
    end
    if map.silent then table.insert(opts, 'silent = true') end
    if map.noremap then table.insert(opts, 'noremap = true') end
    if map.expr then table.insert(opts, 'expr = true') end
    
    local opts_str = #opts > 0 and ', { ' .. table.concat(opts, ', ') .. ' }' or ''
    local rhs = map.rhs:gsub('"', '\\"'):gsub('\n', '\\n')
    
    -- Add comment with description if available
    if map.desc and map.desc ~= '' then
      table.insert(lines, '-- ' .. map.desc)
    end
    
    table.insert(lines, string.format(
      'vim.keymap.set("%s", "<leader>%s", "%s"%s)',
      map.mode, map.key, rhs, opts_str
    ))
  end
  
  return table.concat(lines, '\n')
end

-- Format command mappings for output
local function format_command_mappings(commands)
  local lines = {
    '-- =================================================================',
    '-- USER COMMANDS (Sorted A-Z)',
    '-- =================================================================',
    '-- Generated: ' .. os.date('%Y-%m-%d %H:%M:%S'),
    '-- Total commands: ' .. #commands,
    '-- =================================================================',
    '',
  }
  
  for _, cmd in ipairs(commands) do
    local attrs = {}
    if cmd.bang then table.insert(attrs, 'bang = true') end
    if cmd.bar then table.insert(attrs, 'bar = true') end
    if cmd.range then table.insert(attrs, 'range = true') end
    if cmd.nargs then table.insert(attrs, 'nargs = "' .. cmd.nargs .. '"') end
    if cmd.complete then table.insert(attrs, 'complete = "' .. cmd.complete .. '"') end
    
    local attrs_str = #attrs > 0 and ', { ' .. table.concat(attrs, ', ') .. ' }' or ''
    local def = cmd.definition:gsub('"', '\\"'):gsub('\n', '\\n')
    
    table.insert(lines, string.format(
      'vim.api.nvim_create_user_command("%s", "%s"%s)',
      cmd.name, def, attrs_str
    ))
  end
  
  return table.concat(lines, '\n')
end

-- Main collection function
function M.collect_all()
  print('🔍 Collecting mappings...')
  
  local leader_maps = extract_leader_mappings()
  local commands = extract_command_mappings()
  
  local leader_content = format_leader_mappings(leader_maps)
  local command_content = format_command_mappings(commands)
  
  -- Output directory in jnv config
  local output_dir = vim.fn.expand('~/.config/jnv/lua/user/Read')
  local leader_file = output_dir .. '/LeaderMappings.lua'
  local command_file = output_dir .. '/Commands.lua'
  
  -- Write leader mappings
  local f = io.open(leader_file, 'w')
  if f then
    f:write(leader_content)
    f:close()
    print('✓ Leader mappings saved to: ' .. leader_file)
  else
    print('✗ Failed to write leader mappings')
  end
  
  -- Write commands
  f = io.open(command_file, 'w')
  if f then
    f:write(command_content)
    f:close()
    print('✓ Commands saved to: ' .. command_file)
  else
    print('✗ Failed to write commands')
  end
  
  print(string.format('\n📊 Summary:'))
  print(string.format('   • %d leader mappings', #leader_maps))
  print(string.format('   • %d commands', #commands))
  print('\n✨ Done!')
end

-- Collect only leader mappings
function M.collect_leader()
  print('🔍 Collecting leader mappings...')
  
  local leader_maps = extract_leader_mappings()
  local leader_content = format_leader_mappings(leader_maps)
  
  local output_dir = vim.fn.expand('~/.config/jnv/lua/user/Read')
  local leader_file = output_dir .. '/LeaderMappings.lua'
  
  local f = io.open(leader_file, 'w')
  if f then
    f:write(leader_content)
    f:close()
    print('✓ Leader mappings saved to: ' .. leader_file)
    print(string.format('📊 Collected %d leader mappings', #leader_maps))
  else
    print('✗ Failed to write leader mappings')
  end
end

-- Collect only commands
function M.collect_commands()
  print('🔍 Collecting commands...')
  
  local commands = extract_command_mappings()
  local command_content = format_command_mappings(commands)
  
  local output_dir = vim.fn.expand('~/.config/jnv/lua/user/Read')
  local command_file = output_dir .. '/Commands.lua'
  
  local f = io.open(command_file, 'w')
  if f then
    f:write(command_content)
    f:close()
    print('✓ Commands saved to: ' .. command_file)
    print(string.format('📊 Collected %d commands', #commands))
  else
    print('✗ Failed to write commands')
  end
end

return M
