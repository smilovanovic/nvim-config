return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },         -- Required
    { 'hrsh7th/cmp-nvim-lsp' },     -- Required
    { 'hrsh7th/cmp-buffer' },       -- Optional
    { "hrsh7th/cmp-cmdline" },
    { 'hrsh7th/cmp-path' },         -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' },     -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'minimal',
      set_lsp_keymaps = false,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
      sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " }
    })


    local keymap = vim.keymap -- for conciseness

    -- enable keybinds only for when lsp server available
    local on_attach = function(_, bufnr)
      -- keybind options
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- set keybinds
      -- Telescope
      keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)       -- got to declaration
      keymap.set("n", "gD", ":Telescope lsp_type_definitions<CR>", opts) -- got to declaration
      keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)      -- see definition and make edits in window
      keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)  -- go to implementation
      keymap.set("n", "<leader>sd", ":Telescope diagnostics<CR>", opts)  -- show diagnostics for cursor
      -- native
      keymap.set("n", "<C-f>", function()
        vim.lsp.buf.format({ async = true })
      end, opts)                                                   -- format file
      keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- smart rename
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)        -- jump to previous diagnostic in buffer
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)        -- jump to next diagnostic in buffer
      keymap.set("n", "K", vim.lsp.buf.hover, opts)                -- show documentation for what is under cursor
    end

    lsp.on_attach(on_attach)

    lsp.setup_servers({ 'tsserver', 'eslint', 'cssls', 'lua_ls', 'html' })

    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    lsp.setup_nvim_cmp({
      preselect = 'none',
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
      },
      sources = {
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" },  -- snippets
        { name = "buffer" },   -- text within current buffer
        { name = "path" },     -- file system paths
      },
      mapping = lsp.defaults.cmp_mappings({
            ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-c>"] = cmp.mapping.abort(),        -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })
    })
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    lsp.nvim_workspace()

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })

    vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
  end
}
