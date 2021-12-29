-- vim.diagnostics config
local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "契" }, -- 
    { name = "DiagnosticSignWarn",  text = "契" }, -- 
    { name = "DiagnosticSignHint",  text = "契" }, -- 
    { name = "DiagnosticSignInfo",  text = "契" }, -- 
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

-- TODO: What does this do?
-- I'm pretty sure this is a "debounce" of some kind
-- When your cursor is held (about a second) it will highlight the document
-- When your cursor moves, it will clear the references (but not the highlights)
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

M.on_attach = function(client)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
