return {
  -- Opt out of type-aware linting. nvim-lspconfig's oxlint `before_init` turns
  -- `typeAware` on whenever the project ships `node_modules/.bin/tsgolint` and
  -- `.oxlintrc.json` mentions "typescript" (both true in pigello-next), which
  -- makes oxlint spawn a full-project tsgolint type-check on every change.
  -- Overriding `cmd` cannot disable that; the setting has to be explicit.
  -- Full type-aware checks remain available via `pnpm lint --type-aware` / CI.
  -- The default `cmd` prefers the repo-local `node_modules/.bin/oxlint`.
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      oxlint = {
        settings = { typeAware = false },
      },
    },
  },
}
