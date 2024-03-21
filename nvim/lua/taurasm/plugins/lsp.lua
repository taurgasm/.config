-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    {'folke/neodev.nvim' },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
				'bashls', -- requires npm to be installed
				'cssls', -- requires npm to be installed
				'html', -- requires npm to be installed
				'lua_ls',
				'jsonls', -- requires npm to be installed
				'lemminx',
				'marksman',
				'quick_lint_js',
				'tsserver', -- requires npm to be installed
				'yamlls', -- requires npm to be installed
				'pyright',
      }
    })

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
			local opts = {buffer = bufnr, remap = false}

			vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
			vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
			vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end

    -- Call setup on each LSP server
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end

  end
}

