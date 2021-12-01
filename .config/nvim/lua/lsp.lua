local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local servers = { 'elixirls', 'solargraph' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup{
  cmd = { "/usr/bin/elixir-ls" };
}

lspconfig.solargraph.setup{}

local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'orgmode' }
  }
}

vim.diagnostic.config({
  underline = {
    severity = vim.diagnostic.severity.ERROR
  },
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR
  }
})
