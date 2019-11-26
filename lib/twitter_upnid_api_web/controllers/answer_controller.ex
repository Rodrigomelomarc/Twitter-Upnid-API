defmodule TwitterUpnidApiWeb.AnswerController do
  use TwitterUpnidApiWeb, :controller

  alias TwitterUpnidApi.Twitter
  alias TwitterUpnidApi.Twitter.Answer

  action_fallback TwitterUpnidApiWeb.FallbackController

  def index(conn, _params) do
    answers = Twitter.list_answers()
    render(conn, "index.json", answers: answers)
  end

  def create(conn, %{"id" => tweet_id, "answer" => answer_params}) do
    current_user = Guardian.Plug.current_resource(conn)

    with {:ok, %Answer{} = answer} <- Twitter.create_answer(answer_params, current_user, tweet_id) do
      conn
      |> put_status(:created)
      |> render("created.json", %{answer: answer, user: current_user})
    end
  end

  def show(conn, %{"id" => id}) do
    answer = Twitter.get_answer!(id)
    render(conn, "show.json", answer: answer)
  end

  def like_a_answer(conn, %{"id" => id}) do
    answer = Twitter.get_answer!(id)

    with {:ok, %Answer{} = answer} <- Twitter.like_answer(answer) do
      render(conn, "show.json", answer: answer)
    end
  end
end
