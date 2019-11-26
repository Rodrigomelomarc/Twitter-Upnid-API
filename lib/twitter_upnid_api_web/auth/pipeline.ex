defmodule TwitterUpnidApiWeb.Auth.Pipeline do
    use Guardian.Plug.Pipeline, otp_app: :twitter_upnid_api,
    module: TwitterUpnidApiWeb.Auth.Guardian,
    error_handler: TwitterUpnidApiWeb.Auth.ErrorHandler

    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
end