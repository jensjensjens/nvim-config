return {
  cmd = { 'yaml-language-server', '--stdio' },

  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },

  root_markers = { '.git' },

  settings = {
    format = {
      enable = true,
    },
    validate = {
      enable = true
    },
    schemas = {
      kubernetes = "*.yaml",
      ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
      ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
      ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
      ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
      "*docker-compose*.{yml,yaml}",
    },
  }
}
