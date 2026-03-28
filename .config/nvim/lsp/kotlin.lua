return {
  cmd = { "kotlin-lsp", "--stdio", "--log-level", "DEBUG" },
  filetypes = { "kotlin" },
  settings = {
    jetbrains = {
      kotlin = {
        hints = {
          lambda = { receivers = { parameters = true } },
          type = {
            ["function"] = { parameter = true, ["return"] = true },
          },
          parameters = true,
          ["parameters.compiled"] = true,
          ["parameters.excluded"] = true,
          settings = {
            types = { property = true, variable = true },
            lambda = { ["return"] = true },
            value = {
              ranges = true,
            },
          },
          call = { chains = true },
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true)
  end,
  root_markers = {
    {
      "settings.gradle", -- Gradle (multi-project)
      "settings.gradle.kts", -- Gradle (multi-project)
      "pom.xml", -- Maven
      "build.gradle", -- Gradle
      "build.gradle.kts", -- Gradle
      "workspace.json", -- Used to integrate your own build system
    },
    ".git",
  },
}
