local M = {}

-- Spell checker component
local function create_spell_component()
    return {
        function()
            if vim.wo.spell then
                return '󰓆 ' .. vim.bo.spelllang
            else
                return ''
            end
        end,
        color = { fg = '#9ece6a', gui = 'bold' }
    }
end

-- Diagnostics component
local function create_diagnostics_component()
    return {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        sections = {'error', 'warn', 'info', 'hint'},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        colored = true,
        update_in_insert = false,
        always_visible = false,
    }
end

function M.setup()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'tokyonight',
            component_separators = { left = '│', right = '│'},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', create_diagnostics_component()},
            lualine_c = {'filename'},
            lualine_x = {
                create_spell_component(),
                'filetype'
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {'nvim-tree', 'lazy', 'mason'}
    }
end

return M 