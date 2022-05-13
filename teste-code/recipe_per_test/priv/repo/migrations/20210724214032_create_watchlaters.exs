defmodule RecipePerTest.Repo.Migrations.CreateWatchlaters do
  use Ecto.Migration

  def change do
    create table(:watchlaters) do
      add :link, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:watchlaters, [:user_id])
  end
end
