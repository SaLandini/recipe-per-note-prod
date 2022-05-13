defmodule RecipePerNote.Repo.Migrations.CreateWatchlater do
  use Ecto.Migration

  def change do
    create table(:watchlater) do
      add :title, :string
      add :link, :string
      add :user_id, references(:users)

      timestamps()
    end

    create index(:watchlater, [:user_id])
  end
end
