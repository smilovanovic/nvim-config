-- vim.lsp.set_log_level("debug")
local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

  vim.api.nvim_set_keymap("n", "gi", ":Telescope lsp_implementations<cr>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<cr>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "gt", ":Telescope lsp_type_definitions<cr>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<cr>",
                          {noremap = true, silent = true})
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<Leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                 opts)
  buf_set_keymap("n", "<Leader>K",
                 "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<Leader>wa",
                 "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<Leader>wr",
                 "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<Leader>wl",
                 "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
                 opts)
  buf_set_keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
                 opts)
  -- vim.api.nvim_set_keymap("n", "<Leader>ca", ":Telescope lsp_code_actions<cr>",
  --                         {noremap = true, silent = true})
  -- buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap("n", "<Leader>d", ":Telescope diagnostics<cr>",
                          {noremap = true, silent = true})
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<Leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>",
                 opts)
  -- buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line('$')+1,0})<CR>", opts)
end

-- Setup lspconfig.
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "tsserver", "sumneko_lua", "jsonls", "html", "pyright", "dockerls", "gopls",
  "eslint"
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {debounce_text_changes = 150},
    init_options = {
      preferences = {importModuleSpecifierPreference = "relative"}
    },
    settings = {Lua = {diagnostics = {globals = {"vim", "use"}}}}
  }
end
