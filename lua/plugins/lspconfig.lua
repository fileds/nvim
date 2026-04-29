return {
{
    "neovim/nvim-lspconfig",
    config = function()
      -- New 0.11 style config
      vim.lsp.config("*", {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })

      -- Enable all installed servers
      vim.lsp.enable({
        "pyright",
        "ts_ls",
        "rust_analyzer",
        "clangd",
        "gopls",
        "lua_ls",
      })

      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(e)
          local opts = { buffer = e.buf }
          vim.keymap.set("n", "gd",         vim.lsp.buf.definition,       vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
          vim.keymap.set("n", "K",           vim.lsp.buf.hover,            vim.tbl_extend("force", opts, { desc = "Hover Docs" }))
          vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, vim.tbl_extend("force", opts, { desc = "Workspace Symbol" }))
          vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float,    vim.tbl_extend("force", opts, { desc = "View Diagnostic" }))
          vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,      vim.tbl_extend("force", opts, { desc = "Code Action" }))
          vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references,       vim.tbl_extend("force", opts, { desc = "References" }))
          vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,           vim.tbl_extend("force", opts, { desc = "Rename" }))
          vim.keymap.set("n", "[d",          vim.diagnostic.goto_prev,     vim.tbl_extend("force", opts, { desc = "Prev Diagnostic" }))
          vim.keymap.set("n", "]d",          vim.diagnostic.goto_next,     vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
        end,
      })
    end,
  },
}
