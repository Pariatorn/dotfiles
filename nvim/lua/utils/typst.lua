local M = {}

function M.compile()
    local filepath = vim.api.nvim_buf_get_name(0)
    if filepath:match("%.typ$") then
        vim.fn.system("typst compile " .. vim.fn.shellescape(filepath))
        print("Typst compilation complete")
    else
        print("Not a Typst file")
    end
end

function M.view()
    local filepath = vim.api.nvim_buf_get_name(0)
    if filepath:match("%.typ$") then
        local pdf_path = filepath:gsub("%.typ$", ".pdf")
        if vim.fn.executable("zathura") == 1 then
            vim.fn.jobstart({"zathura", pdf_path}, {detach = true})
            print("Opening PDF in Zathura")
        elseif vim.fn.executable("open") == 1 then
            vim.fn.jobstart({"open", pdf_path}, {detach = true})
            print("Opening PDF with system viewer")
        elseif vim.fn.executable("xdg-open") == 1 then
            vim.fn.jobstart({"xdg-open", pdf_path}, {detach = true})
            print("Opening PDF with default viewer")
        else
            print("No suitable PDF viewer found")
        end
    else
        print("Not a Typst file")
    end
end

return M
