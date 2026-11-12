-- Small helpers around the typst CLI (compile, watch, view)
local M = {}

local watchers = {} -- [typ file path] = job id

local function current_typ()
    local path = vim.api.nvim_buf_get_name(0)
    if not path:match("%.typ$") then
        vim.notify("Not a Typst file", vim.log.levels.WARN)
        return nil
    end
    if vim.fn.executable("typst") ~= 1 then
        vim.notify("typst CLI not found in PATH", vim.log.levels.ERROR)
        return nil
    end
    return path
end

function M.compile()
    local path = current_typ()
    if not path then return end
    vim.system({ "typst", "compile", path }, { text = true }, function(res)
        vim.schedule(function()
            if res.code == 0 then
                vim.notify("Typst: compiled " .. vim.fn.fnamemodify(path, ":t"))
            else
                vim.notify("Typst: compile failed\n" .. (res.stderr or ""), vim.log.levels.ERROR)
            end
        end)
    end)
end

function M.toggle_watch()
    local path = current_typ()
    if not path then return end
    if watchers[path] then
        vim.fn.jobstop(watchers[path])
        watchers[path] = nil
        vim.notify("Typst: watch stopped")
        return
    end
    local id = vim.fn.jobstart({ "typst", "watch", path }, {
        on_exit = function() watchers[path] = nil end,
    })
    if id > 0 then
        watchers[path] = id
        vim.notify("Typst: watching " .. vim.fn.fnamemodify(path, ":t"))
    end
end

function M.view()
    local path = vim.api.nvim_buf_get_name(0)
    if not path:match("%.typ$") then
        vim.notify("Not a Typst file", vim.log.levels.WARN)
        return
    end
    local pdf = path:gsub("%.typ$", ".pdf")
    if not vim.uv.fs_stat(pdf) then
        vim.notify("No PDF yet, compile first", vim.log.levels.WARN)
        return
    end
    if vim.fn.executable("zathura") == 1 then
        vim.fn.jobstart({ "zathura", pdf }, { detach = true })
    else
        vim.ui.open(pdf)
    end
end

-- Stop all watchers when leaving Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        for _, id in pairs(watchers) do vim.fn.jobstop(id) end
    end,
})

return M
