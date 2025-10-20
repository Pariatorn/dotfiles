-- Enable spell checking for certain filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"tex", "latex", "markdown", "typst"},
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelloptions = "camel"
        vim.opt_local.spellsuggest = "best,10"
    end
})

-- Custom spell checking commands
vim.api.nvim_create_user_command("SpellAdd", function(opts)
    local word = opts.args
    if word == "" then
        -- If no argument provided, use word under cursor
        word = vim.fn.expand("<cword>")
    end
    vim.cmd("spellgood " .. word)
    print("Added '" .. word .. "' to spell file")
end, { nargs = "?" })
