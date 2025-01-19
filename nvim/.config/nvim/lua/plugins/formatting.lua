return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[C]ode F]ormatting,'
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },

		-- TODO: HTML
		-- TODO: ESLint with stylistic
		-- TODO: CSS / SCSS

		-- Go formatting:
		-- gofmt for default formatting
		-- goimports for automatically adding and removing imports,
		-- goimports-reviser for grouping imports
		go = { 'gofmt', 'goimports', 'goimports-reviser' },

		-- PHP formatting
		-- phpcbf (PHP Code Beautifier and Fixer) is the default tool we use at WMDE
		-- and I use it as well for my personal projects.
		-- In the future, I might chekc out the slightly more moder php-cs-fixer
		php = { 'phpcbf' },
      },
    },
  }
