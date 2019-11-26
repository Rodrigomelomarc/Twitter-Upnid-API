defmodule TwitterUpnidApiWeb.TweetView do
  use TwitterUpnidApiWeb, :view
  alias TwitterUpnidApiWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet_with_answers.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      body: tweet.body,
      likes: tweet.likes,
      author: tweet.user.nickname
    }
  end

  def render("created.json", %{tweet: tweet, user: user}) do
    %{
      id: tweet.id,
      body: tweet.body,
      likes: tweet.likes,
      author: user.nickname
    }
  end

  def render("tweet_with_answers.json", %{tweet: tweet}) do
    %{id: tweet.id,
      body: tweet.body,
      likes: tweet.likes,
      author: tweet.user.nickname,
      answers: render_many(tweet.answers, __MODULE__, "answers.json", as: :answer)}
  end

  def render("answers.json", %{answer: answer}) do
    %{
      id: answer.id,
      body: answer.body,
      likes: answer.likes,
      author: answer.user.nickname
    }
  end

  def render("tweet_with_retweets.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      body: tweet.body,
      likes: tweet.likes,
      author: tweet.user.nickname,
      retweets: render_many(tweet.retweets, __MODULE__, "retweets.json", as: :retweet)
    }
  end

  def render("retweets.json", %{retweet: retweet}) do
    %{
      id: retweet.id,
      body: retweet.body,
      likes: retweet.likes,
      author: retweet.user.nickname
    }
  end
end
