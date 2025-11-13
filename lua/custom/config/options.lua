-- Additional IDE-focused options (avoiding duplicates from kickstart)

-- Persistent undo levels (undofile already set in kickstart)
vim.opt.undolevels = 10000

-- Better display
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.pumblend = 10  -- Popup blend

-- Line wrapping
vim.opt.wrap = false     -- Display lines as one long line
vim.opt.linebreak = true -- Companion to wrap, don't split words

-- Scroll context
vim.opt.sidescrolloff = 8 -- Columns of context

-- Fold settings
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Better diff
vim.opt.fillchars = { diff = '╱' }

-- Disable swap files
vim.opt.swapfile = false

-- Shorter messages
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Format options
vim.opt.formatoptions = 'jcroqlnt'

-- Spell checking (off by default, can be toggled)
vim.opt.spell = false
vim.opt.spelllang = { 'en' }

-- Session options
vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }

-- Grep settings
if vim.fn.executable('rg') == 1 then
    vim.opt.grepprg = 'rg --vimgrep'
    vim.opt.grepformat = '%f:%l:%c:%m'
end
