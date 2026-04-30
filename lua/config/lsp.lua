-- Shared config applied to ALL servers (on_attach, capabilities, etc.)
vim.lsp.config('*', {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Enable servers (matches filenames in lsp/)
vim.lsp.enable('pyright')

-- Diagnostics display config
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = true,
    },
})

-- Any keymaps 0.11 does NOT set by default
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
        -- grn, gra, grr, gri, gO, K are already set by 0.11
    end,
})
