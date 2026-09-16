return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- Prefer the repo-local binaries over the mason ones on $PATH so the
        -- editor formats with the same version as `pnpm format` / CI.
        oxfmt = {
          command = function(self, ctx)
            return require("conform.util").from_node_modules("oxfmt")(self, ctx)
          end,
          stdin = true,
        },
        biome = {
          command = function(self, ctx)
            return require("conform.util").from_node_modules("biome")(self, ctx)
          end,
          stdin = true,
        },
      },

      formatters_by_ft = {
        javascript = { "oxfmt", "biome", "prettier", stop_after_first = true },
        typescript = { "oxfmt", "biome", stop_after_first = true },
        javascriptreact = { "oxfmt", "biome", stop_after_first = true },
        typescriptreact = { "oxfmt", "biome", stop_after_first = true },
        vue = { "oxfmt", "biome", stop_after_first = true },
        svelte = { "oxfmt", "biome", stop_after_first = true },
        astro = { "prettier" },
      },
    },
  },
}
