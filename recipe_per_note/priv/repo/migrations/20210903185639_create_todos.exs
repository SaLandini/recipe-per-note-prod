defmodule RecipePerNote.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :titles, :string
      add :datelimit, :date
      add :descri, :string

      timestamps()
    end

  end
end
