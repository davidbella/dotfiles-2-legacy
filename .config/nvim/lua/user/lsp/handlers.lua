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
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    float = {
      border = "single",
    },
  }

  vim.diagnostic.config(config)

  local border = {
    {"┌", "FloatBorder"},
    {"─", "FloatBorder"},
    {"┐", "FloatBorder"},
    {"│", "FloatBorder"},
    {"┘", "FloatBorder"},
    {"─", "FloatBorder"},
    {"└", "FloatBorder"},
    {"│", "FloatBorder"},
  }

  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
end

-- I'm pretty sure this is a "debounce" of some kind
-- When your cursor is held (about a second) it will highlight the document
-- When your cursor moves, it will clear the references (but not the highlights)

-- I wasn't _totally_ wrong, I just didn't realize it because this never worked for me before.
--   Updating plugins on 2022-01-09 made this work for some unknown reason.
-- It actually highlights the chunk of code your cursor is on according to the LSP
-- I had previously modified it to display the diagnostic float on cursor
--   but I think that might be annoying.
-- It doesn't work with Elixir because the elixir-ls server doesn't have the capability
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        " opens a float on cursor hover
        " autocmd CursorHold <buffer> lua vim.diagnostic.open_float()
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
    client.server_capabilities.document_formatting = false
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
