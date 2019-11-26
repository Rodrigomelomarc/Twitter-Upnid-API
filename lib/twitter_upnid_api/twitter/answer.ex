defmodule TwitterUpnidApi.Twitter.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :body, :string
    field :likes, :integer, default: 0

    belongs_to :user, TwitterUpnidApi.Accounts.User
    belongs_to :tweet, TwitterUpnidApi.Twitter.Tweet
    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:body, :likes])
    |> cast_assoc(:user)
    |> cast_assoc(:tweet)
    |> validate_required([:body])
  end
end
