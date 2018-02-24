# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_groups,
  ecto_repos: [ElixirGroups.Repo]

# Configures the endpoint
config :elixir_groups, ElixirGroupsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7uxtemwN9N/7mIJ7e1rOmjc3TQnI8JN8F29UZ+ZpnTqelhEIzQdu9b3TlPGFNqC3",
  render_errors: [view: ElixirGroupsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirGroups.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
