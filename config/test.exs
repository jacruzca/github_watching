use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :github_watching, GithubWatchingWeb.Endpoint,
  http: [port: 4002],
  server: false

config :github_watching, gql_helper: GqlHelperBehaviourMock

# Print only warnings and errors during test
config :logger, level: :warn
