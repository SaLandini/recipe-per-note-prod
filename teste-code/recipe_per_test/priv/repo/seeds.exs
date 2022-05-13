# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RecipePerTest.Repo.insert!(%RecipePerTest.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, admin} =
  RecipePerTest.Accounts.register_admin(%{
    email: "admin@company.com",
    password: "123456789abc",
    password_confirmation: "123456789abc"
  })

{:ok, user_1} =
  RecipePerTest.Accounts.register_user(%{
    email: "user1@company.com",
    password: "123456789abc",
    password_confirmation: "123456789abc"
  })


%{link: "https://www.youtube.com/watch?v=IdkCEioCp24",
  user_id: user_1.id}
  |> RecipePerTest.Notes.create_watch_later()

%{link: "https://www.youtube.com/watch?v=CElNWeIifsk",
  user_id: admin.id}
  |> RecipePerTest.Notes.create_watch_later()
