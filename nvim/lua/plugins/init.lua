-- Load all plugin modules
return {
    -- Include UI plugins (dashboard, theme, statusline, file explorer, telescope)
    require("plugins.ui"),
    
    -- Include editor plugins (comment, treesitter)
    require("plugins.editor"),
    
    -- Include LSP plugins (lsp, snippets, completion, linting)
    require("plugins.lsp"),
    
    -- Include LaTeX plugins (vimtex)
    require("plugins.tex"),
    
    -- Include Typst plugins (typst.vim, tinymist, preview)
    require("plugins.typst"),
} 