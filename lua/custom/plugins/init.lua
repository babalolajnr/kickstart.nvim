-- Essential IDE plugins for a minimal but complete experience

return {
    -- Mini.nvim - additional modules
    {
        'echasnovski/mini.nvim',
        event = 'VeryLazy',
        config = function()
            -- Better comments
            require('mini.comment').setup()

            -- Align text
            require('mini.align').setup()

            -- File browser (alternative to neo-tree)
            require('mini.files').setup()

            -- Animations for smooth scrolling
            require('mini.animate').setup({
                scroll = { enable = false }, -- Disable scroll animation if too distracting
            })

            -- Trailing whitespace highlighting and removal
            require('mini.trailspace').setup()

            -- Indentscope - animated indent guides
            require('mini.indentscope').setup({
                symbol = '│',
                options = { try_as_border = true },
            })

            -- Move lines and blocks
            require('mini.move').setup()

            -- Split/join arguments
            require('mini.splitjoin').setup()
        end,
        keys = {
            {
                '<leader>fm',
                function()
                    require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = '[F]ile [M]anager (Mini)',
            },
            {
                '<leader>fM',
                function()
                    require('mini.files').open(vim.loop.cwd(), true)
                end,
                desc = '[F]ile [M]anager CWD (Mini)',
            },
        },
    },

    -- Snacks.nvim - collection of small QoL plugins
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = { enabled = false }, -- using nvim-notify instead
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true },
                },
            },
        },
        keys = {
            { '<leader>un', function() Snacks.notifier.hide() end,           desc = 'Dismiss All Notifications' },
            { '<leader>bd', function() Snacks.bufdelete() end,               desc = 'Delete Buffer' },
            { '<leader>gg', function() Snacks.lazygit() end,                 desc = 'Lazygit' },
            { '<leader>gb', function() Snacks.git.blame_line() end,          desc = 'Git Blame Line' },
            { '<leader>gB', function() Snacks.gitbrowse() end,               desc = 'Git Browse' },
            { '<leader>gf', function() Snacks.lazygit.log_file() end,        desc = 'Lazygit Current File History' },
            { '<leader>gl', function() Snacks.lazygit.log() end,             desc = 'Lazygit Log' },
            { '<leader>cR', function() Snacks.rename.rename_file() end,      desc = 'Rename File' },
            { '<c-/>',      function() Snacks.terminal() end,                desc = 'Toggle Terminal',             mode = { 'n', 't' } },
            { '<c-_>',      function() Snacks.terminal() end,                desc = 'which_key_ignore',            mode = { 'n', 't' } },
            { ']]',         function() Snacks.words.jump(vim.v.count1) end,  desc = 'Next Reference',              mode = { 'n', 't' } },
            { '[[',         function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference',              mode = { 'n', 't' } },
        },
        init = function()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'VeryLazy',
                callback = function()
                    -- Setup some globals for easy access
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd
                end,
            })
        end,
    },


    -- Better quickfix and location list
    {
        'folke/trouble.nvim',
        cmd = { 'Trouble' },
        keys = {
            { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>',              desc = 'Diagnostics (Trouble)' },
            { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
            { '<leader>xl', '<cmd>Trouble loclist toggle<cr>',                  desc = 'Location List (Trouble)' },
            { '<leader>xq', '<cmd>Trouble qflist toggle<cr>',                   desc = 'Quickfix List (Trouble)' },
        },
        opts = {},
    },

    -- Flash for quick navigation
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
            {
                'S',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
        },
    },

    -- Better UI for vim.ui.select and vim.ui.input
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        opts = {},
    },



    -- Better tab/bufferline
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        keys = {
            { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>',            desc = '[B]uffer [P]in' },
            { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = '[B]uffer Delete Non-[P]inned' },
            { '<S-h>',      '<cmd>BufferLineCyclePrev<cr>',            desc = 'Prev Buffer' },
            { '<S-l>',      '<cmd>BufferLineCycleNext<cr>',            desc = 'Next Buffer' },
            { '[b',         '<cmd>BufferLineCyclePrev<cr>',            desc = 'Prev Buffer' },
            { ']b',         '<cmd>BufferLineCycleNext<cr>',            desc = 'Next Buffer' },
        },
        opts = {
            options = {
                close_command = function(n)
                    Snacks.bufdelete(n)
                end,
                right_mouse_command = function(n)
                    Snacks.bufdelete(n)
                end,
                diagnostics = 'nvim_lsp',
                always_show_bufferline = false,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'File Explorer',
                        highlight = 'Directory',
                        text_align = 'left',
                    },
                },
            },
        },
    },

    -- Session management
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        keys = {
            {
                '<leader>qs',
                function()
                    require('persistence').load()
                end,
                desc = 'Restore Session',
            },
            {
                '<leader>ql',
                function()
                    require('persistence').load({ last = true })
                end,
                desc = 'Restore Last Session',
            },
            {
                '<leader>qd',
                function()
                    require('persistence').stop()
                end,
                desc = "Don't Save Current Session",
            },
        },
        opts = {},
    },
}
