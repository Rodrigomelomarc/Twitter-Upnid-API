defmodule TwitterUpnidApi.Twitter.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :body, :string
    field :likes, :integer, default: 0
    field :tweet_id, :id
    field :is_retweet, :boolean, default: false


    #Relation between Tweets and User
    belongs_to :user, TwitterUpnidApi.Accounts.User
    
    #Relations between Tweets and Answers
    has_many :answers, TwitterUpnidApi.Twitter.Answer

    has_many :retweets, TwitterUpnidApi.Twitter.Tweet, foreign_key: :tweet_id

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:body, :likes])
    |> cast_assoc(:user)
    |> cast_assoc(:answers)
    |> cast_assoc(:retweets)
    |> validate_required([:body])
  end
end
