local M = {}

-- VimTeX status component
local function create_vimtex_component()
    return {
        function()
            if vim.bo.filetype ~= 'tex' then return '' end
            local status = ''
            
            -- Check if VimTeX is loaded
            if vim.fn.exists('*vimtex#state#get_id') == 0 then
                return 'VimTeX not loaded'
            end
            
            -- Get the VimTeX compiler state
            local compiler_status = ''
            if vim.g.vimtex_compiler_enabled and vim.b.vimtex and vim.b.vimtex.compiler then
                local compiler = vim.b.vimtex.compiler
                if compiler.is_running() then
                    compiler_status = " 󰄭 Running"
                else
                    if vim.fn.jobid(0) then
                        compiler_status = " 󰄭 Idle"
                    end
                end
            end
            
            -- Get errors count from QuickFix
            local errors_count = 0
            if vim.fn.exists('*getqflist') == 1 then
                for _, item in ipairs(vim.fn.getqflist()) do
                    if item.type == 'E' then
                        errors_count = errors_count + 1
                    end
                end
            end
            
            local errors_info = ''
            if errors_count > 0 then
                errors_info = " 󰅚 " .. errors_count .. " errors"
            end
            
            -- Combine the status components
            status = "LaTeX" .. compiler_status .. errors_info
            return status
        end,
        icon = '󱕪',
        color = { fg = '#7aa2f7', gui = 'bold' }
    }
end

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
        color = { fg = '#a3be8c', gui = 'bold' }
    }
end

-- Diagnostics component
local function create_diagnostics_component()
    return {
        'diagnostics',
        sources = {'nvim_diagnostic', 'nvim_lsp'},
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
            component_separators = { left = '', right = ''},
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
                create_vimtex_component(),
                create_spell_component(),
                'encoding', 
                'fileformat', 
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
        extensions = {'nvim-tree', 'fugitive'}
    }
end

return M 