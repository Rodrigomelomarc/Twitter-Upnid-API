defmodule TwitterUpnidApi.Repo.Migrations.AddRelationBetweenRetweetAndTweet do
  use Ecto.Migration

  def change do
    alter table("tweets") do
      add :tweet_id, references(:tweets)
      add :is_retweet, :boolean, default: false
    end
  end
end
