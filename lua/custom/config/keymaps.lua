-- Essential keymaps for IDE functionality

-- Better neo-tree keymaps (complementing kickstart's backslash key)
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle File [E]xplorer' })
vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<cr>', { desc = 'F[o]cus File Explorer' })

-- Better window management
vim.keymap.set('n', '<leader>ww', '<C-W>p', { desc = 'Other [W]indow' })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = '[W]indow [D]elete' })
vim.keymap.set('n', '<leader>w-', '<C-W>s', { desc = 'Split [W]indow Below' })
vim.keymap.set('n', '<leader>w|', '<C-W>v', { desc = 'Split [W]indow Right' })

-- Better buffer navigation (additional to bufferline)
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other [B]uffer' })
vim.keymap.set('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })

-- Move Lines (handled by mini.move with Alt+hjkl)

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- Quit all
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = '[Q]uit All' })

-- Lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open [L]azy' })

-- New file
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = '[F]ile [N]ew' })

-- Clear search with <esc> (already in kickstart but kept for clarity)
-- vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- Better split navigation (already in kickstart)
-- Already configured in kickstart: <C-h>, <C-j>, <C-k>, <C-l>
