defmodule TwitterUpnidApiWeb.UserController do
  use TwitterUpnidApiWeb, :controller

  alias TwitterUpnidApi.Accounts
  alias TwitterUpnidApi.Accounts.User
  alias TwitterUpnidApiWeb.Auth.Guardian

  action_fallback TwitterUpnidApiWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user, token: token)
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
       |> put_status(:created)
       |> render("user.json", %{user: user, token: token})
    end
  end
end
