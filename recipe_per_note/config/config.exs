# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :recipe_per_note,
  ecto_repos: [RecipePerNote.Repo]

# Configures the endpoint
config :recipe_per_note, RecipePerNoteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Z/R/N9i8zm3H+eROUuuAUYYBAaslEb94HtwLdGwX4GxnFX8NY/a3v424C3omnEFl",
  render_errors: [view: RecipePerNoteWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RecipePerNote.PubSub,
  live_view: [signing_salt: "DmrPxpxb"]

# Configures Bamboo
config :recipe_per_note, RecipePerNote.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 587,
  username: "recipe.per.note@gmail.com",
  password: "R3c1p&perN0t&!",
  tls: :always,
  ssl: false,
  retries: 1

# Configures Oban
config :recipe_per_note, Oban,
  repo: RecipePerNote.Repo,
  plugins: [Oban.Plugins.Pruner, Oban.Plugins.Cron],
  crontab: [
    {"0 23 * * *", RecipePerNote.Annotations.NotifyTodosCloseExpirationWorker}
  ],
  queues: [default: 10, mailer: 10]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
