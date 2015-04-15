use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :clocks, Clocks.Endpoint,
  secret_key_base: "Y2uFT4Q6W4sxGbevAAy6/ehwXEnX/i3FlMXVvtjDOcta2XX45YbYI/T0TZnPxAhv"

# Configure your database
config :clocks, Clocks.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "clocks_prod"
