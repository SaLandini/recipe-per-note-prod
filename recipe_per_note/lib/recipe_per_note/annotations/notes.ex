defmodule RecipePerNote.Annotations.Notes do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipePerNote.Accounts.User

  schema "notes" do
    field :descri_notes, :string
    field :title, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(notes, attrs) do
    notes
    |> cast(attrs, [:title, :descri_notes, :user_id])
    |> validate_required([:title, :descri_notes, :user_id])
  end
end
