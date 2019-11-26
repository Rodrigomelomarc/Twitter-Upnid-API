defmodule TwitterUpnidApi.AccountsTest do
  use TwitterUpnidApi.DataCase

  alias TwitterUpnidApi.Accounts

  describe "users" do
    alias TwitterUpnidApi.Accounts.User

    @valid_attrs %{email: "some_email@teste.com", password: "some password", nickname: "some nickname"}
    @invalid_attrs %{email: nil, password: nil, nickname: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some_email@teste.com"
      assert user.password == "some password"
      assert user.nickname == "some nickname"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
