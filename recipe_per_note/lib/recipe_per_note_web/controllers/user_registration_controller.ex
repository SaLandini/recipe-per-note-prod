defmodule RecipePerNoteWeb.UserRegistrationController do
  use RecipePerNoteWeb, :controller

  alias RecipePerNote.Accounts
  alias RecipePerNote.Accounts.User
  alias RecipePerNoteWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html",error_message: nil, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :confirm, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", error_message: "Invalid email or password", changeset: changeset)
    end
  end
end
