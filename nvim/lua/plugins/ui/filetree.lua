local M = {}

function M.setup()
    require("nvim-tree").setup({
        view = {
            width = 30,
        },
        filters = {
            dotfiles = false,
        },
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            
            -- Helper function for creating keymaps
            local function map(key, action, desc)
                vim.keymap.set('n', key, action, { desc = desc, buffer = bufnr, noremap = true, silent = true })
            end
            
            -- Basic navigation
            map('l', api.node.open.edit, "Expand folder or open file")
            map('h', api.node.navigate.parent_close, "Close parent directory")
            map('<CR>', api.node.open.edit, "Open")
            map('o', api.node.open.edit, "Open")
            map('a', api.fs.create, "Create")
            map('d', api.fs.remove, "Delete")
            map('r', api.fs.rename, "Rename")
            map('x', api.fs.cut, "Cut")
            map('c', api.fs.copy.node, "Copy")
            map('p', api.fs.paste, "Paste")
            map('y', api.fs.copy.filename, "Copy name")
            map('Y', api.fs.copy.relative_path, "Copy relative path")
            map('gy', api.fs.copy.absolute_path, "Copy absolute path")
            map('I', api.tree.toggle_gitignore_filter, "Toggle git ignore")
            map('H', api.tree.toggle_hidden_filter, "Toggle hidden files")
            map('R', api.tree.reload, "Refresh")
            
            -- Navigation
            map('[c', api.node.navigate.git.prev, "Previous Git")
            map(']c', api.node.navigate.git.next, "Next Git")
            map('[d', api.node.navigate.diagnostics.prev, "Previous Diagnostic")
            map(']d', api.node.navigate.diagnostics.next, "Next Diagnostic")
            
            -- Help
            map('?', api.tree.toggle_help, "Help")
        end,
    })
end

return M 