defmodule TwitterUpnidApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :nickname, :string
    field :password, :string, virtual: true
    has_many :tweets, TwitterUpnidApi.Twitter.Tweet

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nickname, :email, :password])
    |> validate_required([:nickname, :email, :password])
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> put_hashed_password
  end

  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}}
       ->
        put_change(changeset, :encrypted_password, Bcrypt.hash_pwd_salt(password))
      _->
          changeset  
    end
  end
end
