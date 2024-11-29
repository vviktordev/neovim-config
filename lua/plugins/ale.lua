-- linting
return {
  'dense-analysis/ale',
  config = function()
    local g = vim.g

    g.ale_ruby_rubocop_auto_correct_all = 1
    g.ale_lint_on_enter = 0
    g.ale_disable_lsp = 1
    g.ale_linters_explicit = 1

    g.ale_linters = {
      ruby = { 'rubocop', 'ruby' },
      lua = { 'lua_language_server' },
      php = { 'intelephense' },
      css = { 'csslint' },
      javascript = { 'eslint' },
    }
  end,
}
