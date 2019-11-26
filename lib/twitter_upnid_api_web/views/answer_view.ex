defmodule TwitterUpnidApiWeb.AnswerView do
  use TwitterUpnidApiWeb, :view
  alias TwitterUpnidApiWeb.AnswerView

  def render("index.json", %{answers: answers}) do
    %{data: render_many(answers, AnswerView, "answer.json")}
  end

  def render("show.json", %{answer: answer}) do
    %{data: render_one(answer, AnswerView, "answer.json")}
  end

  def render("answer.json", %{answer: answer}) do
    %{id: answer.id,
      body: answer.body,
      likes: answer.likes,
      author: answer.user.nickname}
  end

  def render("created.json", %{answer: answer, user: user}) do
    %{id: answer.id,
      body: answer.body,
      likes: answer.likes,
      author: user.nickname}
  end
end
