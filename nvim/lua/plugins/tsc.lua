-- LazyVim enables inlay hints for every capable server; the native tsc LSP
-- emits type hints by default, which shows greyed-out inferred types inline.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
