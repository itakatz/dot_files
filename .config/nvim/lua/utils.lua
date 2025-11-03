local M = {}

-- Function to get the Pyright diagnostic code at the current cursor position
local function get_pyright_diagnostic_code()
  local diagnostics = vim.diagnostic.get(0, {
    lnum = vim.fn.line('.') - 1, -- Line number is 0-indexed
  })

  for _, diag in ipairs(diagnostics) do
    if diag.source == 'Pyright' and diag.code then
      -- Pyright diagnostic codes are often strings like "reportName"
      return diag.code
    end
  end
  return nil
end

M.pyright_ignore_action = function()
  local code = get_pyright_diagnostic_code()

  if code then
    local current_line = vim.api.nvim_get_current_line()
    local comment = ' # pyright: ignore [' .. tostring(code) .. ']'

    -- Check if the ignore comment is already present
    if not current_line:match(comment) then
      -- Append the ignore comment to the current line
      vim.api.nvim_set_current_line(current_line .. comment)
      print('Added Pyright ignore: ' .. tostring(code))
    else
      print('Pyright ignore already present.')
    end
  else
    print('No Pyright diagnostic found on this line.')
  end
end

-- Example Keymap (add this to your configuration)
-- vim.keymap.set('n', '<leader>pa', M.pyright_ignore_action, { desc = 'Ignore Pyright Diagnostic' })
return M
