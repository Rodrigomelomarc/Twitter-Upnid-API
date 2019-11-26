# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :twitter_upnid_api,
  ecto_repos: [TwitterUpnidApi.Repo]

# Configures the endpoint
config :twitter_upnid_api, TwitterUpnidApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PZQ3aZUdhbC180BSqEUrRhZkKRjUlDed8Ur7o2aZvw/p3BvBNNTuujgxl4T/9rtn",
  render_errors: [view: TwitterUpnidApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: TwitterUpnidApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :twitter_upnid_api, TwitterUpnidApiWeb.Auth.Guardian,
       issuer: "twitter_upnid_api",
       secret_key: "uRKrRMZSiMefoKs8ZsTUbPKypbsRTrbT+tbpxb3Wbfns0gXnCAuk4iQu0jBwdpR4"