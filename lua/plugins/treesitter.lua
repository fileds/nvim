return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        local languages = {
            "vimdoc", 
            "bash",
            "css",
            "dockerfile",
            "go",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "php",
            "python",
            "scss",
            "sql",
            "typescript",
            "vim",
            "vue",
            "yaml",
        }
        ts.setup({
            ensure_installed = languages,
        })
        -- ts.install(languages)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function()
                vim.treesitter.start()
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"
                vim.wo.foldlevel = 99
                -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
