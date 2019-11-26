defmodule TwitterUpnidApi.Twitter do
  @moduledoc """
  The Twitter context.
  """

  import Ecto.Query, warn: false
  alias TwitterUpnidApi.Repo

  alias TwitterUpnidApi.Twitter.Tweet
  alias TwitterUpnidApi.Accounts.User

  @doc """
  Returns the list of tweets.

  ## Examples

      iex> list_tweets()
      [%Tweet{}, ...]

  """
  def list_tweets do
    Repo.all(from t in Tweet, preload: [:user], order_by: [desc: :inserted_at])
  end

  @doc """
  Gets a single tweet.

  Raises `Ecto.NoResultsError` if the Tweet does not exist.

  ## Examples

      iex> get_tweet!(123)
      %Tweet{}

      iex> get_tweet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tweet!(id), do: Repo.one!(from t in Tweet, where: t.id == ^id, preload: [{:answers, :user}, :user])

  @doc """
  Creates a tweet.

  ## Examples

      iex> create_tweet(%{field: value})
      {:ok, %Tweet{}}

      iex> create_tweet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tweet(attrs \\ %{}, %User{} = user) do

    user
      |> Ecto.build_assoc(:tweets)
      |> Tweet.changeset(attrs)
      |> Repo.insert()
  end

  @doc """
  Updates a tweet.

  ## Examples

      iex> update_tweet(tweet, %{field: new_value})
      {:ok, %Tweet{}}

      iex> update_tweet(tweet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tweet(%Tweet{} = tweet, attrs) do
    tweet
    |> Tweet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tweet.

  ## Examples

      iex> delete_tweet(tweet)
      {:ok, %Tweet{}}

      iex> delete_tweet(tweet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tweet(%Tweet{} = tweet) do
    Repo.delete(tweet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tweet changes.

  ## Examples

      iex> change_tweet(tweet)
      %Ecto.Changeset{source: %Tweet{}}

  """
  def change_tweet(%Tweet{} = tweet) do
    Tweet.changeset(tweet, %{})
  end

  def update_likes(%Tweet{} = tweet) do
    new_value = tweet.likes + 1

    tweet
      |> Tweet.changeset(%{likes: new_value})
      |> Repo.update()
  end

  def create_retweet(id, user) do
    original_tweet = Repo.get!(Tweet, id)

    %Tweet{user_id: user.id, tweet_id: original_tweet.id, likes: 0, body: original_tweet.body, is_retweet: true}
      |> Repo.insert()
  end

  def show_tweet_with_retweets(id), do: Repo.one!(from t in Tweet, where: t.id == ^id, preload: [{:retweets, :user}, :user])
    
  alias TwitterUpnidApi.Twitter.Answer

  @doc """
  Returns the list of answers.

  ## Examples

      iex> list_answers()
      [%Answer{}, ...]

  """
  def list_answers do
    Repo.all(from a in Answer, order_by: [desc: :inserted_at], preload: [:user])
  end

  @doc """
  Gets a single answer.

  Raises `Ecto.NoResultsError` if the Answer does not exist.

  ## Examples

      iex> get_answer!(123)
      %Answer{}

      iex> get_answer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_answer!(id), do: Repo.one!(from a in Answer, where: a.id == ^id, preload: [:user])

  @doc """
  Creates a answer.

  ## Examples

      iex> create_answer(%{field: value})
      {:ok, %Answer{}}

      iex> create_answer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_answer(attrs \\ %{}, user, tweet_id) do
      tweet = get_tweet!(tweet_id)
      %Answer{user_id: user.id, tweet_id: tweet.id}
      |> Answer.changeset(attrs)
      |> Repo.insert()
  end

  @doc """
  Updates a answer.

  ## Examples

      iex> update_answer(answer, %{field: new_value})
      {:ok, %Answer{}}

      iex> update_answer(answer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_answer(%Answer{} = answer, attrs) do
    answer
    |> Answer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Answer.post

  ## Examples

      iex> delete_answer(answer)
      {:ok, %Answer{}}

      iex> delete_answer(answer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_answer(%Answer{} = answer) do
    Repo.delete(answer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking answer changes.

  ## Examples

      iex> change_answer(answer)
      %Ecto.Changeset{source: %Answer{}}

  """
  def change_answer(%Answer{} = answer) do
    Answer.changeset(answer, %{})
  end

  def like_answer(%Answer{} = answer) do
    new_value = answer.likes + 1

    answer
      |> Answer.changeset(%{likes: new_value})
      |> Repo.update()
  end
end
