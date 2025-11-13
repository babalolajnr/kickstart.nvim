# IDE Plugins Added to Kickstart Nvim

This document summarizes the essential IDE plugins added to your minimal kickstart config.

## Added Plugins

### 1. **mini.nvim** (Additional Modules)
Beyond the modules already in kickstart (mini.ai, mini.surround, mini.statusline), we've added:

**mini.comment**
- Better comment toggling
- `gcc` - Toggle line comment
- `gc` - Toggle comment (with motion or visual)

**mini.align**
- Align text by character
- `ga` - Align with preview

**mini.files**
- Lightweight file browser
- Keymaps:
  - `<leader>fm` - Open file manager at current file
  - `<leader>fM` - Open file manager at CWD

**mini.animate**
- Smooth scrolling and cursor animations (scroll disabled by default)

**mini.trailspace**
- Highlight and remove trailing whitespace

**mini.indentscope**
- Animated indent guides showing current scope
- Visual scope indicator with `│`

**mini.move**
- Move lines and blocks with Alt+hjkl
- `<A-h>` / `<A-l>` - Move character/selection left/right
- `<A-j>` / `<A-k>` - Move line/selection down/up

**mini.splitjoin**
- Split/join function arguments and other structures
- `gS` - Toggle split/join

### 2. **snacks.nvim**
- Collection of small QoL plugins by folke
- Features:
  - Buffer deletion without closing windows
  - Floating terminal
  - Git integration (lazygit, blame, browse)
  - File renaming
  - Word references jumping
  - Big file handling
  - Debug utilities
- Keymaps:
  - `<C-/>` - Toggle terminal
  - `<leader>bd` - Delete buffer
  - `<leader>gg` - Open Lazygit
  - `<leader>gb` - Git blame line
  - `<leader>gB` - Git browse (open in browser)
  - `<leader>gf` - File history in Lazygit
  - `<leader>gl` - Git log in Lazygit
  - `<leader>cR` - Rename file
  - `]]` - Next word reference
  - `[[` - Previous word reference
  - `<leader>un` - Dismiss notifications

### 3. **trouble.nvim**
- Beautiful diagnostics and quickfix list
- Keymaps:
  - `<leader>xx` - Open diagnostics (Trouble)
  - `<leader>xX` - Open buffer diagnostics
  - `<leader>xl` - Open location list
  - `<leader>xq` - Open quickfix list

### 4. **flash.nvim**
- Fast navigation with search labels
- Keymaps:
  - `s` - Flash jump
  - `S` - Flash treesitter

### 5. **dressing.nvim**
- Better UI for vim.ui.select and vim.ui.input
- Automatically enhances LSP code actions, renames, etc.

### 6. **bufferline.nvim**
- Tab-like buffer line at the top
- Keymaps:
  - `<S-h>` or `[b` - Previous buffer
  - `<S-l>` or `]b` - Next buffer
  - `<leader>bp` - Pin/unpin buffer
  - `<leader>bP` - Delete non-pinned buffers

### 7. **persistence.nvim**
- Session management
- Keymaps:
  - `<leader>qs` - Restore session for current directory
  - `<leader>ql` - Restore last session
  - `<leader>qd` - Don't save current session

## Additional Keymaps

### Git (Snacks)
- `<leader>gg` - Open Lazygit
- `<leader>gb` - Git blame line
- `<leader>gB` - Git browse (GitHub/GitLab)
- `<leader>gf` - File history
- `<leader>gl` - Git log

### File Explorer (Neo-tree)
- `<leader>e` - Toggle file explorer
- `<leader>o` - Focus file explorer
- `\` - Reveal current file (from kickstart)

### File Manager (Mini.files)
- `<leader>fm` - Open file manager at current file
- `<leader>fM` - Open file manager at CWD

### Terminal (Snacks)
- `<C-/>` - Toggle floating terminal

### Code Actions
- `<leader>cR` - Rename file

### Comments (Mini.comment)
- `gcc` - Toggle line comment
- `gc` - Toggle comment (with motion/visual)

### Text Alignment (Mini.align)
- `ga` - Align text with preview

### Split/Join (Mini.splitjoin)
- `gS` - Toggle split/join arguments

### Window Management
- `<leader>ww` - Switch to other window
- `<leader>wd` - Delete window
- `<leader>w-` - Split window below
- `<leader>w|` - Split window right

### Buffer Navigation
- `<leader>bb` or `<leader>` ` - Switch to alternate buffer
- `<leader>bd` - Delete buffer

### Line Movement
- `<A-j>` / `<A-k>` - Move line down/up (normal/visual/insert)

### Better Indenting
- `<` / `>` in visual mode - Indent and keep selection

### Move Lines/Blocks (Mini.move)
- `<A-h>` / `<A-l>` - Move character/selection left/right
- `<A-j>` / `<A-k>` - Move line/selection down/up

### Word References (Snacks)
- `]]` - Next reference
- `[[` - Previous reference

### General
- `<C-s>` - Save file (all modes)
- `<leader>qq` - Quit all
- `<leader>l` - Open Lazy plugin manager
- `<leader>fn` - New file
- `<leader>un` - Dismiss all notifications

## Enhanced Options

Additional IDE-focused options have been configured:
- Better completion experience
- Persistent undo with 10000 levels
- Popup transparency and sizing
- Line wrapping disabled by default
- Treesitter-based folding
- Session management options
- Ripgrep integration for grep if available
- Big file handling for better performance
- Status column improvements
- Animated indent scope guides
- Trailing whitespace handling

## Already Available (from Kickstart)

Your kickstart config already includes:
- LSP with Mason (gopls, rust_analyzer, lua_ls)
- Telescope fuzzy finder
- Treesitter syntax highlighting
- Autocompletion with blink.cmp
- Autoformatting with conform.nvim
- Git signs
- Debug adapter protocol (DAP)
- Linting
- Auto pairs (nvim-autopairs)
- Indent guides
- Todo comments highlighting
- Mini.nvim core modules (ai, surround, statusline)

## Next Steps

1. Restart Neovim - plugins will install automatically via Lazy
2. Run `:checkhealth` to verify everything is working
3. Explore keymaps with `<leader>` (which-key will show you options)
4. Customize further in `~/.config/nvim/lua/custom/`

## File Structure

```
~/.config/nvim/
├── init.lua                          # Main config
├── lua/
│   ├── custom/
│   │   ├── config/
│   │   │   ├── init.lua             # Loads custom configs
│   │   │   ├── keymaps.lua          # Custom keymaps
│   │   │   └── options.lua          # Custom options
│   │   └── plugins/
│   │       └── init.lua             # Custom plugins
│   └── kickstart/
│       └── plugins/                 # Kickstart plugins
└── lazy-lock.json                   # Plugin versions lock
```

All plugins use lazy loading for fast startup times.