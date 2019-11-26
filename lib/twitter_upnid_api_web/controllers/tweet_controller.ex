defmodule TwitterUpnidApiWeb.TweetController do
  use TwitterUpnidApiWeb, :controller

  alias TwitterUpnidApi.Twitter
  alias TwitterUpnidApi.Twitter.Tweet

  action_fallback TwitterUpnidApiWeb.FallbackController

  def index(conn, _params) do
    tweets = Twitter.list_tweets()
    render(conn, "index.json", tweets: tweets)
  end

  def create(conn, %{"tweet" => tweet_params}) do
    current_user = Guardian.Plug.current_resource(conn)

    with {:ok, %Tweet{} = tweet} <- Twitter.create_tweet(tweet_params, current_user) do
      conn
      |> put_status(:created)
      |> render("created.json", %{tweet: tweet, user: current_user})
    end
  end

  def show(conn, %{"id" => id}) do
      tweet = Twitter.get_tweet!(id)
      render(conn, "show.json", %{tweet: tweet})
  end

  def like_tweet(conn, %{"id" => id}) do
    tweet = Twitter.get_tweet!(id)
    
    with {:ok, %Tweet{} = tweet} <- Twitter.update_likes(tweet) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def do_a_retweet(conn, %{"id" => id}) do
    current_user = Guardian.Plug.current_resource(conn)

    with {:ok, %Tweet{} = tweet} <- Twitter.create_retweet(id, current_user) do
      conn
        |> put_status(:created)
        |> render("created.json", %{tweet: tweet, user: current_user})
    end
  end

  def show_tweet_and_list_retweets(conn, %{"id" => id}) do
    tweet = Twitter.show_tweet_with_retweets(id)
    render(conn, "tweet_with_retweets.json", %{tweet: tweet})
  end
end
