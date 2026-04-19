local home = os.getenv("HOME")

return {
  cmd = { 'yaml-language-server', '--stdio' },

  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values', 'yaml.cloudformation' },

  root_markers = { '.git' },

  settings = {
    yaml = {
      format = {
        enable = true,
      },
      validate = true,
      customTags = {
        "!And",
        "!Base64",
        "!Cidr",
        "!Equals",
        "!FindInMap",
        "!GetAtt",
        "!GetAZs",
        "!If",
        "!ImportValue",
        "!Join",
        "!Not",
        "!Or",
        "!Ref",
        "!Select",
        "!Split",
        "!Sub",
        "!Transform",
        "!Condition"
      },
      schemas = {
        ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
        "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = {
          "iac-prod/**/*.yaml",
          "iac-stage/**/*.yaml",
          "iac-test/**/*.yaml"
        },
        kubernetes = "*.yaml",
      },
    }
  }
}
