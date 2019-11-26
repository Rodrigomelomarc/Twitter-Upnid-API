defmodule TwitterUpnidApi.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :body, :string
      add :likes, :integer, default: 0

      timestamps()
    end

  end
end
