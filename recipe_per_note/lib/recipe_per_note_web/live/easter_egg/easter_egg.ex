defmodule RecipePerNoteWeb.EasterEgg do
  use RecipePerNoteWeb, :live_view

  def mount(_params, session, socket) do
    socket = assign_defaults(session, socket)
    {:ok, assign( socket, query: "", results: %{})}
  end
end
