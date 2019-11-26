defmodule TwitterUpnidApi.TwitterTest do
  use TwitterUpnidApi.DataCase

  alias TwitterUpnidApi.Twitter

  describe "tweets" do
    alias TwitterUpnidApi.Twitter.Tweet

    @valid_attrs %{body: "some body"}
    @invalid_attrs %{body: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Twitter.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Twitter.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Twitter.create_tweet(@valid_attrs)
      assert tweet.body == "some body"
      assert tweet.likes == 42
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_tweet(@invalid_attrs)
    end
  end

  describe "answers" do
    alias TwitterUpnidApi.Twitter.Answer

    @valid_attrs %{body: "some body", likes: 42}
    @update_attrs %{body: "some updated body", likes: 43}
    @invalid_attrs %{body: nil, likes: nil}

    def answer_fixture(attrs \\ %{}) do
      {:ok, answer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_answer()

      answer
    end

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Twitter.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Twitter.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      assert {:ok, %Answer{} = answer} = Twitter.create_answer(@valid_attrs)
      assert answer.body == "some body"
      assert answer.likes == 42
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{} = answer} = Twitter.update_answer(answer, @update_attrs)
      assert answer.body == "some updated body"
      assert answer.likes == 43
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_answer(answer, @invalid_attrs)
      assert answer == Twitter.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Twitter.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Twitter.change_answer(answer)
    end
  end
end
