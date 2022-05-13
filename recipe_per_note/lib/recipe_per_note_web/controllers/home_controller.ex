defmodule RecipePerNoteWeb.HomeController do
  use RecipePerNoteWeb, :controller

  alias RecipePerNote.Annotations
  alias RecipePerNote.Accounts.User
  alias RecipePerNote.ComparesTime.Time

  def index(conn, _params) do
    todos = todos_have_something?(list_todos(Date.utc_today))

    notes = notes_have_something?(list_notes(conn))

    watchlater = watchlater_have_something?(list_watchlater(conn))

    render(conn, "home.html", todos: todos, notes: notes, watchlater: watchlater)
  end

  defp list_todos(date) do
    Annotations.list_todos_from_date(date)
  end

  defp todos_have_something?(todos) do
    if todos == [] do
      :nada
    else
      todos
    end
  end

  defp list_notes(conn) do
    Annotations.list_notes(conn.assigns.current_user)
  end

  defp notes_have_something?(notes) do
    if notes == [] do
      :nada
    else
      notes
    end
  end

  defp list_watchlater(conn) do
    Annotations.list_watchlater(conn.assigns.current_user)
  end

  defp watchlater_have_something?(watchlater) do
    if watchlater == [] do
      :nada
    else
      watchlater
    end
  end

end
