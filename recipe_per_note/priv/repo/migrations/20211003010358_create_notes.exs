defmodule RecipePerNote.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :title, :string
      add :descri_notes, :string
      add :user_id, references(:users)

      timestamps()
    end

    create index(:notes, [:user_id])
  end
end
