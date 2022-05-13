defmodule RecipePerTest.Notes.WatchLater do
  use Ecto.Schema
  import Ecto.Changeset

  schema "watchlaters" do
    field :link, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(watch_later, attrs) do
    watch_later
    |> cast(attrs, [:link, :user_id])
    |> validate_required([:link, :user_id])
  end
end
