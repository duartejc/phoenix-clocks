use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :clocks, Clocks.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :clocks, Clocks.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "clocks_test",
  size: 1,
  max_overflow: false
