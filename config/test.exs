use Mix.Config

# Configure your database
config :timesheets, Timesheets.Repo,
  username: "timesheets",
  password: "le0xaa9Aesai",
  database: "timesheets_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timesheets, TimesheetsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
