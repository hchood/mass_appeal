# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mass_appeal_hh_lvdk,
  ecto_repos: [MassAppealHhLvdk.Repo]

# Configures the endpoint
config :mass_appeal_hh_lvdk, MassAppealHhLvdk.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wjkrXUogUa5OwNGWMCIOAfkfrjyunfIPJvO+qd7UO6Z4QLgWd2EYGWPerXKY7oOk",
  render_errors: [view: MassAppealHhLvdk.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: MassAppealHhLvdk.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
