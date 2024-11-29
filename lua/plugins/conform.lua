return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      php = { 'phpcbf' }, -- phpcbf is set to work with --standard=WordPress. Setting an additional formatter with command "phpcbf" makes added text be deleted *BUG*
      javascript = { 'prettier' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
    formatters = {
      -- ['phpcbf-wordpress'] = { -- DOES NOT WORK. Deletes added text instead of formatting it
      --   command = 'phpcbf',
      --   args = { '--standard=WordPress', '-q', '--stdin-path=', '$FILENAME', '-' },
      --   stdin = true,
      --   exit_codes = { 0, 1, 2 },
      -- },
      phpcbf = {
        prepend_args = { '--standard=WordPress' },
      },
    },
  },
}
