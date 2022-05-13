defmodule RecipePerNote.Annotations.WatchLater do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipePerNote.Accounts.User

  schema "watchlater" do
    field :link, :string
    field :title, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(watch_later, attrs) do
    watch_later
    |> cast(attrs, [:title, :link, :user_id])
    |> validate_required([:title, :link, :user_id])
  end
end
