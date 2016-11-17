# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :services,
  ecto_repos: [Services.Repo]

# Configures the endpoint
config :services, Services.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8BBb3vkhIMzzLr6BPBVK+vDLzcULBLPOrVKm7yUmsW3g6Ril8xRpff+VHf42CndX",
  render_errors: [view: Services.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Services.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
