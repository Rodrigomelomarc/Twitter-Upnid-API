defmodule TwitterUpnidApi.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :body, :string
      add :likes, :integer, default: 0
      add :user_id, references(:users, on_delete: :nothing)
      add :tweet_id, references(:tweets, on_delete: :nothing)

      timestamps()
    end

    create index(:answers, [:user_id])
    create index(:answers, [:tweet_id])
  end
end
