# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hyf,
  ecto_repos: [Hyf.Repo]

# Configures the endpoint
config :hyf, HyfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ebtxwp2XfpIxgZGIxC45z6uQMCnOy4J3ZPa2TFRR9eVZrjx1NNDv4lOvmeB6yMZe",
  render_errors: [view: HyfWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hyf.PubSub,
  live_view: [signing_salt: "RQ3Tt1nK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
