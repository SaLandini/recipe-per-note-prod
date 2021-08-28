defmodule RecipePerNote.Repo do
  use Ecto.Repo,
    otp_app: :recipe_per_note,
    adapter: Ecto.Adapters.Postgres
end
