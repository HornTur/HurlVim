-- -- -- Advanced Multi-cursor implementation for Neovim (Full VSCode-like experience)
-- -- -- Features: Real-time editing, cursor movement, backspace, insert mode, and more

-- -- local M = {}
-- -- M.cursors = {}
-- -- M.active = false
-- -- M.in_insert = false
-- -- M.namespace = vim.api.nvim_create_namespace('multicursor')
-- -- M.main_cursor_idx = nil

-- -- -- Clear all virtual cursors
-- -- local function clear_cursors()
  -- -- vim.api.nvim_buf_clear_namespace(0, M.namespace, 0, -1)
  -- -- M.cursors = {}
  -- -- M.active = false
  -- -- M.in_insert = false
  -- -- M.main_cursor_idx = nil
-- -- end

-- -- -- Draw virtual cursors
-- -- local function draw_cursors()
  -- -- vim.api.nvim_buf_clear_namespace(0, M.namespace, 0, -1)
  -- -- for i, pos in ipairs(M.cursors) do
    -- -- local line_idx = pos[1] - 1
    -- -- local col = pos[2]
    
    -- -- -- Validate line exists
    -- -- local line_count = vim.api.nvim_buf_line_count(0)
    -- -- if line_idx < 0 or line_idx >= line_count then
      -- -- goto continue
    -- -- end
    
    -- -- -- Validate column is within line bounds
    -- -- local line_text = vim.api.nvim_buf_get_lines(0, line_idx, line_idx + 1, false)[1] or ""
    -- -- if col < 0 or col > #line_text then
      -- -- col = math.max(0, math.min(col, #line_text))
      -- -- M.cursors[i] = {pos[1], col}  -- Fix the cursor position
    -- -- end
    
    -- -- local is_main = (i == M.main_cursor_idx)
    -- -- pcall(vim.api.nvim_buf_set_extmark, 0, M.namespace, line_idx, col, {
      -- -- virt_text = {{is_main and '█' or '│', is_main and 'CursorLine' or 'Cursor'}},
      -- -- virt_text_pos = 'overlay',
      -- -- hl_mode = 'combine',
    -- -- })
    
    -- -- ::continue::
  -- -- end
-- -- end

-- -- -- Add cursor at current position
-- -- function M.add_cursor_here()
  -- -- local pos = vim.api.nvim_win_get_cursor(0)
  -- -- for _, existing in ipairs(M.cursors) do
    -- -- if existing[1] == pos[1] and existing[2] == pos[2] then
      -- -- print("Cursor already exists here")
      -- -- return
    -- -- end
  -- -- end
  -- -- table.insert(M.cursors, pos)
  -- -- M.main_cursor_idx = #M.cursors
  -- -- M.active = true
  -- -- draw_cursors()
  -- -- print(string.format("Cursors: %d", #M.cursors))
-- -- end

-- -- -- Add cursor at word under cursor
-- -- function M.add_cursor_at_word()
  -- -- local word = vim.fn.expand('<cword>')
  -- -- if word == '' then
    -- -- print("No word under cursor")
    -- -- return
  -- -- end
  
  -- -- vim.cmd('normal! b')
  -- -- local word_start = vim.api.nvim_win_get_cursor(0)
  
  -- -- for _, existing in ipairs(M.cursors) do
    -- -- if existing[1] == word_start[1] and existing[2] == word_start[2] then
      -- -- print("Cursor already exists on this word")
      -- -- return
    -- -- end
  -- -- end
  
  -- -- table.insert(M.cursors, word_start)
  -- -- M.main_cursor_idx = #M.cursors
  -- -- M.active = true
  -- -- draw_cursors()
  -- -- print(string.format("Added cursor at '%s' - Total: %d", word, #M.cursors))
-- -- end

-- -- -- Select all occurrences of word
-- -- function M.select_all_word()
  -- -- local word = vim.fn.expand('<cword>')
  -- -- if word == '' then
    -- -- print("No word under cursor")
    -- -- return
  -- -- end
  
  -- -- clear_cursors()
  -- -- local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  -- -- local pattern = '\\<' .. vim.pesc(word) .. '\\>'
  
  -- -- for line_num, line_text in ipairs(lines) do
    -- -- local col = 1
    -- -- while true do
      -- -- local start_col = vim.fn.match(line_text, pattern, col - 1)
      -- -- local end_col = vim.fn.matchend(line_text, pattern, col - 1)
      -- -- if start_col == -1 then break end
      -- -- table.insert(M.cursors, {line_num, start_col})
      -- -- col = end_col + 1
    -- -- end
  -- -- end
  
  -- -- if #M.cursors > 0 then
    -- -- M.main_cursor_idx = 1
    -- -- M.active = true
    -- -- draw_cursors()
    -- -- print(string.format("Selected %d occurrences of '%s'", #M.cursors, word))
  -- -- end
-- -- end

-- -- -- Select next occurrence
-- -- function M.select_next_word()
  -- -- local word = vim.fn.expand('<cword>')
  -- -- if word == '' then
    -- -- print("No word under cursor")
    -- -- return
  -- -- end
  
  -- -- local current_pos = vim.api.nvim_win_get_cursor(0)
  -- -- local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  -- -- local pattern = '\\<' .. vim.pesc(word) .. '\\>'
  
  -- -- for line_num = current_pos[1], #lines do
    -- -- local start_col = (line_num == current_pos[1]) and current_pos[2] + 1 or 0
    -- -- local match_col = vim.fn.match(lines[line_num], pattern, start_col)
    
    -- -- if match_col ~= -1 then
      -- -- table.insert(M.cursors, {line_num, match_col})
      -- -- M.main_cursor_idx = #M.cursors
      -- -- vim.api.nvim_win_set_cursor(0, {line_num, match_col})
      -- -- M.active = true
      -- -- draw_cursors()
      -- -- print(string.format("Cursors: %d", #M.cursors))
      -- -- return
    -- -- end
  -- -- end
  
  -- -- for line_num = 1, current_pos[1] - 1 do
    -- -- local match_col = vim.fn.match(lines[line_num], pattern, 0)
    -- -- if match_col ~= -1 then
      -- -- table.insert(M.cursors, {line_num, match_col})
      -- -- M.main_cursor_idx = #M.cursors
      -- -- vim.api.nvim_win_set_cursor(0, {line_num, match_col})
      -- -- M.active = true
      -- -- draw_cursors()
      -- -- print(string.format("Cursors: %d (wrapped)", #M.cursors))
      -- -- return
    -- -- end
  -- -- end
  
  -- -- print(string.format("No more matches for '%s'", word))
-- -- end

-- -- -- Add cursors to visual selection (COMPLETELY REWRITTEN)
-- -- function M.add_cursors_to_selection()
  -- -- -- Force exit visual mode first and wait for marks to settle
  -- -- vim.cmd('normal! ')
  
  -- -- -- Small delay to ensure marks are set
  -- -- vim.defer_fn(function()
    -- -- local start_line = vim.fn.line("'<")
    -- -- local end_line = vim.fn.line("'>")
    -- -- local start_col = vim.fn.col("'<") - 1
    
    -- -- -- Validate selection
    -- -- local buf_line_count = vim.api.nvim_buf_line_count(0)
    -- -- if start_line <= 0 or end_line <= 0 or start_line > end_line or end_line > buf_line_count then
      -- -- print("Invalid selection")
      -- -- return
    -- -- end
    
    -- -- clear_cursors()
    
    -- -- -- Add cursor to each line in the selection ONLY
    -- -- local count = 0
    -- -- for line = start_line, end_line do
      -- -- if line <= buf_line_count then
        -- -- local line_text = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1] or ""
        -- -- local col = vim.fn.match(line_text, '\\S')
        -- -- if col == -1 then col = 0 end
        
        -- -- table.insert(M.cursors, {line, col})
        -- -- count = count + 1
      -- -- end
    -- -- end
    
    -- -- if count == 0 then
      -- -- print("No cursors added")
      -- -- return
    -- -- end
    
    -- -- M.main_cursor_idx = 1
    -- -- M.active = true
    -- -- draw_cursors()
    -- -- print(string.format("Added %d cursors to lines %d-%d", count, start_line, end_line))
  -- -- end, 10)
-- -- end

-- -- -- Add cursor above/below
-- -- function M.add_cursor_down()
  -- -- local pos = vim.api.nvim_win_get_cursor(0)
  -- -- if pos[1] < vim.api.nvim_buf_line_count(0) then
    -- -- local new_pos = {pos[1] + 1, pos[2]}
    -- -- table.insert(M.cursors, new_pos)
    -- -- M.main_cursor_idx = #M.cursors
    -- -- vim.api.nvim_win_set_cursor(0, new_pos)
    -- -- M.active = true
    -- -- draw_cursors()
  -- -- end
-- -- end

-- -- function M.add_cursor_up()
  -- -- local pos = vim.api.nvim_win_get_cursor(0)
  -- -- if pos[1] > 1 then
    -- -- local new_pos = {pos[1] - 1, pos[2]}
    -- -- table.insert(M.cursors, new_pos)
    -- -- M.main_cursor_idx = #M.cursors
    -- -- vim.api.nvim_win_set_cursor(0, new_pos)
    -- -- M.active = true
    -- -- draw_cursors()
  -- -- end
-- -- end

-- -- -- REAL-TIME INSERT MODE WITH ARROW KEY SUPPORT (ENTER FIXED)
-- -- function M.start_insert()
  -- -- if not M.active or #M.cursors == 0 then
    -- -- vim.api.nvim_feedkeys('i', 'n', false)
    -- -- return
  -- -- end
  
  -- -- M.in_insert = true
  -- -- local insert_buf = vim.api.nvim_get_current_buf()
  -- -- print("Multi-cursor insert mode (ESC to exit, arrows to move)")
  
  -- -- -- Create autocmd for text changes
  -- -- local group = vim.api.nvim_create_augroup('MultiCursorInsert', {clear = true})
  
  -- -- -- Track the main cursor changes
  -- -- local last_tick = vim.b.changedtick
  -- -- local last_line_count = vim.api.nvim_buf_line_count(0)
  -- -- local last_main_pos = vim.api.nvim_win_get_cursor(0)
  -- -- local last_main_line = vim.api.nvim_buf_get_lines(0, last_main_pos[1] - 1, last_main_pos[1], false)[1] or ""
  
  -- -- -- Track cursor movement in insert mode
  -- -- vim.api.nvim_create_autocmd('CursorMovedI', {
    -- -- group = group,
    -- -- buffer = insert_buf,
    -- -- callback = function()
      -- -- if not M.in_insert then return end
      
      -- -- local main_pos = vim.api.nvim_win_get_cursor(0)
      -- -- local main_line = vim.api.nvim_buf_get_lines(0, main_pos[1] - 1, main_pos[1], false)[1] or ""
      -- -- local col_diff = main_pos[2] - last_main_pos[2]
      -- -- local line_diff = main_pos[1] - last_main_pos[1]
      
      -- -- -- Only process pure movement (no text change)
      -- -- -- Check if buffer changed OR if line content changed
      -- -- if vim.b.changedtick == last_tick and main_line == last_main_line then
        -- -- -- This is pure cursor movement (arrow keys)
        -- -- -- Apply same movement to all cursors
        -- -- for i, pos in ipairs(M.cursors) do
          -- -- -- Skip the main cursor position
          -- -- if not (pos[1] == last_main_pos[1] and pos[2] == last_main_pos[2]) then
            -- -- local new_line = pos[1] + line_diff
            -- -- local new_col = pos[2] + col_diff
            
            -- -- -- Validate new position
            -- -- if new_line >= 1 and new_line <= vim.api.nvim_buf_line_count(0) then
              -- -- local line_text = vim.api.nvim_buf_get_lines(0, new_line - 1, new_line, false)[1] or ""
              -- -- new_col = math.max(0, math.min(new_col, #line_text))
              -- -- M.cursors[i] = {new_line, new_col}
            -- -- end
          -- -- else
            -- -- -- Update main cursor position
            -- -- M.cursors[i] = {main_pos[1], main_pos[2]}
          -- -- end
        -- -- end
        
        -- -- vim.schedule(function() draw_cursors() end)
        -- -- last_main_pos = main_pos
      -- -- end
    -- -- end
  -- -- })
  
  -- -- -- Custom Enter key handler
  -- -- vim.keymap.set('i', '<CR>', function()
    -- -- if not M.in_insert then return '<CR>' end
    
    -- -- -- Get current state before Enter
    -- -- local main_pos = vim.api.nvim_win_get_cursor(0)
    -- -- local main_line = vim.api.nvim_buf_get_lines(0, main_pos[1] - 1, main_pos[1], false)[1] or ""
    
    -- -- -- Execute Enter at main cursor first
    -- -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', true)
    
    -- -- -- Wait for main cursor Enter to complete, then replicate
    -- -- vim.schedule(function()
      -- -- if not M.in_insert then return end
      
      -- -- -- Get all other cursors (not the main one)
      -- -- local other_cursors = {}
      -- -- for _, pos in ipairs(M.cursors) do
        -- -- if not (pos[1] == main_pos[1] and pos[2] == main_pos[2]) then
          -- -- table.insert(other_cursors, pos)
        -- -- end
      -- -- end
      
      -- -- -- Sort bottom to top
      -- -- table.sort(other_cursors, function(a, b)
        -- -- return a[1] > b[1] or (a[1] == b[1] and a[2] > b[2])
      -- -- end)
      
      -- -- -- Apply Enter to each cursor
      -- -- for _, pos in ipairs(other_cursors) do
        -- -- local line = vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], false)[1] or ""
        -- -- local before = line:sub(1, pos[2])
        -- -- local after = line:sub(pos[2] + 1)
        
        -- -- -- Split the line
        -- -- vim.api.nvim_buf_set_lines(0, pos[1] - 1, pos[1], false, {before, after})
        
        -- -- -- Update cursor position in our list
        -- -- for j, c in ipairs(M.cursors) do
          -- -- if c[1] == pos[1] and c[2] == pos[2] then
            -- -- M.cursors[j] = {pos[1] + 1, 0}
            -- -- break
          -- -- end
        -- -- end
      -- -- end
      
      -- -- -- Update main cursor position in list
      -- -- local new_main_pos = vim.api.nvim_win_get_cursor(0)
      -- -- for j, c in ipairs(M.cursors) do
        -- -- if c[1] == main_pos[1] and c[2] == main_pos[2] then
          -- -- M.cursors[j] = {new_main_pos[1], new_main_pos[2]}
          -- -- break
        -- -- end
      -- -- end
      
      -- -- -- Update tracking
      -- -- last_main_pos = new_main_pos
      -- -- last_line_count = vim.api.nvim_buf_line_count(0)
      -- -- last_main_line = vim.api.nvim_buf_get_lines(0, new_main_pos[1] - 1, new_main_pos[1], false)[1] or ""
      -- -- last_tick = vim.b.changedtick
      
      -- -- draw_cursors()
    -- -- end)
    
    -- -- return ''
  -- -- end, {buffer = insert_buf, noremap = true, expr = true})
  
  -- -- vim.api.nvim_create_autocmd({'TextChangedI', 'TextChangedP'}, {
    -- -- group = group,
    -- -- buffer = insert_buf,
    -- -- callback = function()
      -- -- if not M.in_insert then return end
      
      -- -- local current_tick = vim.b.changedtick
      -- -- if current_tick == last_tick then return end
      -- -- last_tick = current_tick
      
      -- -- -- Get current main cursor info
      -- -- local main_pos = vim.api.nvim_win_get_cursor(0)
      -- -- local current_line_count = vim.api.nvim_buf_line_count(0)
      -- -- local main_line = vim.api.nvim_buf_get_lines(0, main_pos[1] - 1, main_pos[1], false)[1] or ""
      
      -- -- -- Determine what changed
      -- -- local col_diff = main_pos[2] - last_main_pos[2]
      -- -- local line_diff = main_pos[1] - last_main_pos[1]
      -- -- local line_count_diff = current_line_count - last_line_count
      -- -- local line_len_diff = #main_line - #last_main_line
      
      -- -- -- Handle regular text insertion (NO line change, NO line count change)
      -- -- if line_diff == 0 and line_count_diff == 0 and col_diff > 0 and line_len_diff > 0 then
        -- -- local typed_text = main_line:sub(last_main_pos[2] + 1, main_pos[2])
        
        -- -- -- Apply to other cursors (bottom to top)
        -- -- local other_cursors = {}
        -- -- for _, pos in ipairs(M.cursors) do
          -- -- if not (pos[1] == last_main_pos[1] and pos[2] == last_main_pos[2]) then
            -- -- table.insert(other_cursors, pos)
          -- -- end
        -- -- end
        
        -- -- table.sort(other_cursors, function(a, b)
          -- -- return a[1] > b[1] or (a[1] == b[1] and a[2] > b[2])
        -- -- end)
        
        -- -- for _, pos in ipairs(other_cursors) do
          -- -- local line = vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], false)[1] or ""
          -- -- local new_line = line:sub(1, pos[2]) .. typed_text .. line:sub(pos[2] + 1)
          -- -- vim.api.nvim_buf_set_lines(0, pos[1] - 1, pos[1], false, {new_line})
          
          -- -- -- Update cursor position
          -- -- for j, c in ipairs(M.cursors) do
            -- -- if c[1] == pos[1] and c[2] == pos[2] then
              -- -- M.cursors[j] = {pos[1], pos[2] + #typed_text}
              -- -- break
            -- -- end
          -- -- end
        -- -- end
        
        -- -- -- Update main cursor in list
        -- -- for j, c in ipairs(M.cursors) do
          -- -- if c[1] == last_main_pos[1] and c[2] == last_main_pos[2] then
            -- -- M.cursors[j] = {main_pos[1], main_pos[2]}
            -- -- break
          -- -- end
        -- -- end
      
      -- -- -- Handle backspace/deletion (NO line change, NO line count change)
      -- -- elseif line_diff == 0 and line_count_diff == 0 and col_diff < 0 and line_len_diff < 0 then
        -- -- local chars_deleted = math.abs(line_len_diff)
        
        -- -- -- Apply to other cursors (bottom to top)
        -- -- local other_cursors = {}
        -- -- for _, pos in ipairs(M.cursors) do
          -- -- if not (pos[1] == main_pos[1] and pos[2] == main_pos[2]) then
            -- -- table.insert(other_cursors, pos)
          -- -- end
        -- -- end
        
        -- -- table.sort(other_cursors, function(a, b)
          -- -- return a[1] > b[1] or (a[1] == b[1] and a[2] > b[2])
        -- -- end)
        
        -- -- for _, pos in ipairs(other_cursors) do
          -- -- if pos[2] >= chars_deleted then
            -- -- local line = vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], false)[1] or ""
            -- local new_line = line:sub(1, pos[2] - chars_deleted) .. line:sub(pos[2] + 1)
            -- vim.api.nvim_buf_set_lines(0, pos[1] - 1, pos[1], false, {new_line})
            
            -- -- Update cursor position
            -- for j, c in ipairs(M.cursors) do
              -- if c[1] == pos[1] and c[2] == pos[2] then
                -- M.cursors[j] = {pos[1], pos[2] - chars_deleted}
                -- break
              -- end
            -- end
          -- end
        -- end
        
        -- -- Update main cursor in list
        -- for j, c in ipairs(M.cursors) do
          -- if c[1] == last_main_pos[1] and c[2] == last_main_pos[2] then
            -- M.cursors[j] = {main_pos[1], main_pos[2]}
            -- break
          -- end
        -- end
      -- end
      
      -- -- Update tracking variables
      -- last_main_pos = main_pos
      -- last_main_line = main_line
      -- last_line_count = current_line_count
      
      -- vim.schedule(function() draw_cursors() end)
    -- end
  -- })
  
  -- -- Handle ESC to exit insert mode
  -- vim.keymap.set('i', '<Esc>', function()
    -- M.in_insert = false
    -- pcall(vim.api.nvim_del_augroup_by_name, 'MultiCursorInsert')
    
    -- -- Clean up keymaps
    -- pcall(vim.keymap.del, 'i', '<Esc>', {buffer = insert_buf})
    -- pcall(vim.keymap.del, 'i', '<CR>', {buffer = insert_buf})
    
    -- vim.schedule(function()
      -- draw_cursors()
      -- print("Exited multi-cursor insert")
    -- end)
    -- return '<Esc>'
  -- end, {buffer = insert_buf, noremap = true, expr = true})
  
  -- vim.api.nvim_feedkeys('i', 'n', false)
-- end

-- -- BACKSPACE support
-- function M.backspace()
  -- if not M.active or #M.cursors == 0 then
    -- return false
  -- end
  
  -- table.sort(M.cursors, function(a, b) return a[1] > b[1] or (a[1] == b[1] and a[2] > b[2]) end)
  
  -- for i, pos in ipairs(M.cursors) do
    -- if pos[2] > 0 then
      -- local line = vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], false)[1] or ""
      -- local new_line = line:sub(1, pos[2] - 1) .. line:sub(pos[2] + 1)
      -- vim.api.nvim_buf_set_lines(0, pos[1] - 1, pos[1], false, {new_line})
      -- M.cursors[i] = {pos[1], pos[2] - 1}
    -- end
  -- end
  
  -- draw_cursors()
  -- return true
-- end

-- -- MOVEMENT: Move all cursors
-- function M.move_left()
  -- if not M.active then return false end
  -- for i, pos in ipairs(M.cursors) do
    -- if pos[2] > 0 then
      -- M.cursors[i] = {pos[1], pos[2] - 1}
    -- end
  -- end
  -- draw_cursors()
  -- return true
-- end

-- function M.move_right()
  -- if not M.active then return false end
  -- for i, pos in ipairs(M.cursors) do
    -- local line = vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], false)[1] or ""
    -- if pos[2] < #line then
      -- M.cursors[i] = {pos[1], pos[2] + 1}
    -- end
  -- end
  -- draw_cursors()
  -- return true
-- end

-- function M.move_up()
  -- if not M.active then return false end
  -- for i, pos in ipairs(M.cursors) do
    -- if pos[1] > 1 then
      -- M.cursors[i] = {pos[1] - 1, pos[2]}
    -- end
  -- end
  -- draw_cursors()
  -- return true
-- end

-- function M.move_down()
  -- if not M.active then return false end
  -- for i, pos in ipairs(M.cursors) do
    -- if pos[1] < vim.api.nvim_buf_line_count(0) then
      -- M.cursors[i] = {pos[1] + 1, pos[2]}
    -- end
  -- end
  -- draw_cursors()
  -- return true
-- end

-- -- DELETE operations
-- function M.delete_char()
  -- if not M.active then
    -- vim.cmd('normal! x')
    -- return
  -- end
  
  -- table.sort(M.cursors, function(a, b) return a[1] > b[1] or (a[1] == b[1] and a[2] > b[2]) end)
  
  -- for _, pos in ipairs(M.cursors) do
    -- vim.api.nvim_win_set_cursor(0, pos)
    -- vim.cmd('normal! x')
  -- end
  
  -- draw_cursors()
-- end

-- function M.delete_word()
  -- if not M.active then
    -- vim.cmd('normal! dw')
    -- return
  -- end
  
  -- table.sort(M.cursors, function(a, b) return a[1] > b[1] or (a[1] == b[1] and a[2] > b[2]) end)
  
  -- for _, pos in ipairs(M.cursors) do
    -- vim.api.nvim_win_set_cursor(0, pos)
    -- vim.cmd('normal! dw')
  -- end
  
  -- vim.schedule(function() draw_cursors() end)
-- end

-- -- Change word
-- function M.change_word()
  -- if not M.active then
    -- vim.api.nvim_feedkeys('cw', 'n', false)
    -- return
  -- end
  
  -- local text = vim.fn.input("Change to: ")
  -- if text == '' then return end
  
  -- table.sort(M.cursors, function(a, b) return a[1] > b[1] or (a[1] == b[1] and a[2] > b[2]) end)
  
  -- for _, pos in ipairs(M.cursors) do
    -- vim.api.nvim_win_set_cursor(0, pos)
    -- vim.cmd('normal! ciw')
    -- vim.api.nvim_put({text}, 'c', false, true)
  -- end
  
  -- clear_cursors()
-- end

-- -- Undo last cursor
-- function M.undo_cursor()
  -- if #M.cursors > 0 then
    -- table.remove(M.cursors)
    -- if M.main_cursor_idx == #M.cursors + 1 then
      -- M.main_cursor_idx = #M.cursors
    -- end
    -- draw_cursors()
    -- print(string.format("Cursors: %d", #M.cursors))
    -- if #M.cursors == 0 then
      -- M.active = false
    -- end
  -- end
-- end

-- -- Setup keymaps
-- function M.setup()
  -- local opts = {noremap = true, silent = true}
  
  -- -- Selection
  -- vim.keymap.set('n', '<C-n>', M.select_next_word, vim.tbl_extend('force', opts, {desc = 'Select next occurrence'}))
  -- vim.keymap.set('n', '<leader><C-n>', M.select_all_word, vim.tbl_extend('force', opts, {desc = 'Select all occurrences'}))
  -- vim.keymap.set('v', '<C-n>', M.add_cursors_to_selection, vim.tbl_extend('force', opts, {desc = 'Add cursors to lines'}))
  
  -- -- Manual placement (KEY FEATURE: <leader>cu)
  -- vim.keymap.set('n', '<leader>cu', M.add_cursor_here, vim.tbl_extend('force', opts, {desc = 'Add cursor at position'}))
  -- vim.keymap.set('n', '<leader>cw', M.add_cursor_at_word, vim.tbl_extend('force', opts, {desc = 'Add cursor at word'}))
  -- vim.keymap.set('n', '<C-Down>', M.add_cursor_down, vim.tbl_extend('force', opts, {desc = 'Add cursor below'}))
  -- vim.keymap.set('n', '<C-Up>', M.add_cursor_up, vim.tbl_extend('force', opts, {desc = 'Add cursor above'}))
  
  -- -- Insert mode (REAL-TIME)
  -- vim.keymap.set('n', '<leader>mi', M.start_insert, vim.tbl_extend('force', opts, {desc = 'Multi-cursor insert'}))
  -- vim.keymap.set('n', 'i', function()
    -- if M.active then M.start_insert() else vim.api.nvim_feedkeys('i', 'n', false) end
  -- end, opts)
  
  -- -- Movement
  -- vim.keymap.set('n', '<leader>mh', M.move_left, vim.tbl_extend('force', opts, {desc = 'Move cursors left'}))
  -- vim.keymap.set('n', '<leader>ml', M.move_right, vim.tbl_extend('force', opts, {desc = 'Move cursors right'}))
  -- vim.keymap.set('n', '<leader>mk', M.move_up, vim.tbl_extend('force', opts, {desc = 'Move cursors up'}))
  -- vim.keymap.set('n', '<leader>mj', M.move_down, vim.tbl_extend('force', opts, {desc = 'Move cursors down'}))
  
  -- -- Deletion
  -- vim.keymap.set('n', '<leader>mx', M.delete_char, vim.tbl_extend('force', opts, {desc = 'Delete char'}))
  -- vim.keymap.set('n', '<leader>md', M.delete_word, vim.tbl_extend('force', opts, {desc = 'Delete word'}))
  -- vim.keymap.set('n', '<leader>mc', M.change_word, vim.tbl_extend('force', opts, {desc = 'Change word'}))
  -- vim.keymap.set('n', '<leader>mb', M.backspace, vim.tbl_extend('force', opts, {desc = 'Backspace'}))
  
  -- -- Clear and undo
  -- vim.keymap.set('n', '<Esc>', function()
    -- if M.active then clear_cursors() else vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false) end
  -- end, opts)
  -- vim.keymap.set('n', '<leader>mu', M.undo_cursor, vim.tbl_extend('force', opts, {desc = 'Undo last cursor'}))
  
  -- print("Advanced Multi-cursor loaded! Use <leader>cu to place cursor")
-- end

-- M.setup()
-- return M
