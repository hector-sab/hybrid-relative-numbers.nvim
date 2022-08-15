local M = {}

-- Improved hybrid number_relateivenumber mode
-- It will only show relative numbers on the window with focus or if in
-- edit mode.
function M.activate_number_toggle()

  if (vim.opt["number"]._value == false) then
      vim.opt["number"] = true
  end

  if (vim.opt["relativenumber"]._value == false) then
      vim.opt["relativenumber"] = true
  end

  M.number_toggle = vim.api.nvim_create_augroup("NumberToggle", { clear = true })

  vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"},
    {
      pattern = { "*" },
      callback = function() vim.opt["relativenumber"] = true end,
      group = M.number_toggle,
    }
  )

  vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"},
    {
      pattern = { "*" },
      callback = function() vim.opt["relativenumber"] = false end,
      group = M.number_toggle,
    }
  )
end

function M.deactivate_number_toggle()
  vim.api.nvim_del_augroup_by_name("NumberToggle")
end

return M
