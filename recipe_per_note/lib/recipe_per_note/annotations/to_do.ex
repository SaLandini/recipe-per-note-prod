defmodule RecipePerNote.Annotations.ToDo do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipePerNote.Accounts.User

  schema "todos" do
    field :datelimit, :date
    field :descri, :string
    field :titles, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(to_do, attrs) do
    to_do
    |> cast(attrs, [:titles, :datelimit, :descri, :user_id])
    |> validate_required([:titles, :datelimit, :descri, :user_id])
  end
end
