-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Trigger InsertLeave event
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Simulate actual keypress
function Press_key(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- -- Function to handle 'o' with count
-- function Custom_o()
--   local count = vim.v.count1
--   for i = 0, count - 2, 1 do
--     Press_key('o', 'n')
--     Press_key('<C-c>', 'n')
--   end
--   Press_key('o', 'n')
-- end
--
-- -- Function to handle 'O' with count
-- function Custom_O()
--   local count = vim.v.count1
--   for i = 0, count - 2, 1 do
--     Press_key('O', 'n')
--     Press_key('<C-c>', 'n')
--   end
--   Press_key('O', 'n')
-- end

-- Handle {count}o/O commands
vim.keymap.set('n', 'o', 'o<C-c>a<C-f>')
vim.keymap.set('n', 'O', 'O<C-c>a<C-f>')

-- Open file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Toggle undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Move lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep coursor in the middle when searching
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Prevent * from jumping to the next occurence
vim.keymap.set('n', '*', '*N')

function RunCode()
  vim.cmd 'wa'
  vim.cmd 'term dotnet run'
end

-- Run C#
vim.keymap.set('n', '<leader>cr', ':lua RunCode()<CR>')

-- Close current buffer without deleting split window - automatically go back to previous buffer
vim.keymap.set('n', '<leader>bd', ':bp|bd#<CR>')

function InsertPhp()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '<?php  ?>' })
  vim.api.nvim_win_set_cursor(0, { row, col + 6 })
end

-- Insert "<?php" on <C-/> (to solve the issue of html indentation breaking when typing "<?" inside html)
vim.keymap.set('i', '<C-_>', InsertPhp)
