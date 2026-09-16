return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- The native tsc LSP asks nvim to watch `<root>/**/*`. Neovim's built-in
      -- exclude list skips node_modules but not Next.js build output, so every
      -- `next dev` rebuild pushed hundreds of `.next/dev/**` change events into
      -- the server right after each save. `_poll_exclude_pattern` is a private
      -- Neovim API; if it goes away, the fallback is
      -- `servers.tsc.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false`.
      local ok, watchfiles = pcall(require, "vim.lsp._watchfiles")
      if ok and watchfiles._poll_exclude_pattern then
        watchfiles._poll_exclude_pattern = watchfiles._poll_exclude_pattern
          + vim.glob.to_lpeg("**/.next/**")
          + vim.glob.to_lpeg("**/.open-next/**")
      end

      -- LazyVim enables inlay hints for every capable server; the native tsc LSP
      -- emits type hints by default, which shows greyed-out inferred types inline.
      opts.inlay_hints = { enabled = false }
      return opts
    end,
  },
}
