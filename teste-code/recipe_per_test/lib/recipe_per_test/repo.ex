defmodule RecipePerTest.Repo do
  use Ecto.Repo,
    otp_app: :recipe_per_test,
    adapter: Ecto.Adapters.Postgres
end
