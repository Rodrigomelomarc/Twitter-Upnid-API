defmodule TwitterUpnidApi.Repo do
  use Ecto.Repo,
    otp_app: :twitter_upnid_api,
    adapter: Ecto.Adapters.Postgres
end
