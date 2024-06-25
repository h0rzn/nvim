local function pretty_table(tbl)
  if type(tbl) == 'table' then
      local s = '{ '
      for k,v in pairs(tbl) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. pretty_table(v) .. ','
      end
      return s .. '}\n'
   else
      return tostring(tbl) .. '\n'
   end
end

-- Function to open a new buffer and pretty print the table
local function table_in_buffer(tbl)
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Get pretty string of the table
  local pretty_string = pretty_table(tbl)
  -- Split the pretty string into lines
  local lines = {}
  for line in pretty_string:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end

  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Open a new split window
  vim.cmd('vsplit')
  local win = vim.api.nvim_get_current_win()

  -- Set the buffer in the new window
  vim.api.nvim_win_set_buf(win, buf)

  -- Optionally set some options to make it read-only and disable line numbers
  -- vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  -- vim.api.nvim_win_set_option(win, 'number', false)
end


return {
  table_in_buffer = table_in_buffer
}
